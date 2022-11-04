module Main exposing (main)

import Auth
import Auth.Action
import Browser
import Browser.Navigation
import Effect exposing (Effect)
import Html exposing (Html)
import Json.Decode
import Page
import Pages.Home_
import Pages.Work
import Pages.NotFound_
import Route
import Route.Path
import Shared
import Url exposing (Url)
import View exposing (View)


main : Program Json.Decode.Value Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = View.toBrowserDocument << view
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }



-- INIT


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url
    , page : PageModel
    , shared : Shared.Model
    }


type PageModel
    = PageModelHome_
    | PageModelWork
    | PageModelNotFound_
    | Redirecting
    | Loading (View Never)


init : Json.Decode.Value -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init json url key =
    let
        flagsResult : Result Json.Decode.Error Shared.Flags
        flagsResult =
            Json.Decode.decodeValue Shared.decoder json

        ( sharedModel, sharedEffect ) =
            Shared.init flagsResult (Route.fromUrl () url)

        ( pageModel, pageCmd ) =
            initPage { key = key, url = url, shared = sharedModel }
    in
    ( { url = url
      , key = key
      , page = pageModel
      , shared = sharedModel
      }
    , Cmd.batch
          [ pageCmd
          , fromSharedEffect key sharedEffect
          ]
    )


initPage : { key : Browser.Navigation.Key, url : Url, shared : Shared.Model } -> ( PageModel, Cmd Msg )
initPage model =
    case Route.Path.fromUrl model.url of
        Route.Path.Home_ ->
            ( PageModelHome_, Cmd.none )

        Route.Path.Work ->
            ( PageModelWork, Cmd.none )

        Route.Path.NotFound_ ->
            ( PageModelNotFound_
            , Cmd.none
            )


runWhenAuthenticated : { model | shared : Shared.Model, url : Url, key : Browser.Navigation.Key } -> (Auth.User -> ( PageModel, Cmd Msg )) -> ( PageModel, Cmd Msg )
runWhenAuthenticated model toTuple =
    let
        authAction : Auth.Action.Action Auth.User
        authAction =
            Auth.onPageLoad model.shared (Route.fromUrl () model.url)

        toCmd : Effect Msg -> Cmd Msg
        toCmd =
            Effect.toCmd
                { key = model.key
                , fromSharedMsg = SharedSent
                , fromPageMsg = identity
                }
    in
    case authAction of
        Auth.Action.LoadPageWithUser user ->
            toTuple user

        Auth.Action.ShowLoadingPage loadingView ->
            ( Loading loadingView
            , Cmd.none
            )

        Auth.Action.ReplaceRoute options ->
            ( Redirecting
            , toCmd (Effect.replaceRoute options)
            )

        Auth.Action.PushRoute options ->
            ( Redirecting
            , toCmd (Effect.pushRoute options)
            )

        Auth.Action.LoadExternalUrl externalUrl ->
            ( Redirecting
            , Browser.Navigation.load externalUrl
            )



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url
    | PageSent PageMsg
    | SharedSent Shared.Msg


type PageMsg
    = Msg_Home_
    | Msg_Work
    | Msg_NotFound_


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested (Browser.Internal url) ->
            ( model
            , Browser.Navigation.pushUrl model.key (Url.toString url)
            )

        UrlRequested (Browser.External url) ->
            ( model
            , Browser.Navigation.load url
            )

        UrlChanged url ->
            if url.path == model.url.path then
                ( { model | url = url }
                , Cmd.none
                )

            else
                let
                    ( pageModel, pageCmd ) =
                        initPage { key = model.key, shared = model.shared, url = url }
                in
                ( { model | url = url, page = pageModel }
                , pageCmd
                )

        PageSent pageMsg ->
            let
                ( pageModel, pageCmd ) =
                    updateFromPage pageMsg model
            in
            ( { model | page = pageModel }
            , pageCmd
            )

        SharedSent sharedMsg ->
            let
                ( sharedModel, sharedEffect ) =
                    Shared.update (Route.fromUrl () model.url) sharedMsg model.shared

                ( oldAction, newAction ) =
                    ( Auth.onPageLoad model.shared (Route.fromUrl () model.url)
                    , Auth.onPageLoad sharedModel (Route.fromUrl () model.url)
                    )
            in
            case oldAction /= newAction of
                True ->
                    let
                        ( pageModel, pageCmd ) =
                            initPage { key = model.key, shared = sharedModel, url = model.url }
                    in
                    ( { model | shared = sharedModel, page = pageModel }
                    , Cmd.batch
                          [ pageCmd
                          , fromSharedEffect model.key sharedEffect
                          ]
                    )

                False ->
                    ( { model | shared = sharedModel }
                    , fromSharedEffect model.key sharedEffect
                    )


updateFromPage : PageMsg -> Model -> ( PageModel, Cmd Msg )
updateFromPage msg model =
    case ( msg, model.page ) of
        ( Msg_Home_, PageModelHome_ ) ->
            ( model.page
            , Cmd.none
            )

        ( Msg_Work, PageModelWork ) ->
            ( model.page
            , Cmd.none
            )

        ( Msg_NotFound_, PageModelNotFound_ ) ->
            ( model.page
            , Cmd.none
            )

        _ ->
            ( model.page
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        subscriptionsFromPage : Sub Msg
        subscriptionsFromPage =
            case model.page of
                PageModelHome_ ->
                    Sub.none

                PageModelWork ->
                    Sub.none

                PageModelNotFound_ ->
                    Sub.none

                Redirecting ->
                    Sub.none

                Loading _ ->
                    Sub.none
    in
    Sub.batch
        [ Shared.subscriptions (Route.fromUrl () model.url) model.shared
              |> Sub.map SharedSent
        , subscriptionsFromPage
        ]



-- VIEW


view : Model -> View Msg
view model =
    case model.page of
        PageModelHome_ ->
            (Pages.Home_.page)

        PageModelWork ->
            (Pages.Work.page)

        PageModelNotFound_ ->
            Pages.NotFound_.page

        Redirecting ->
            View.none

        Loading loadingView ->
            View.map never loadingView



-- INTERNALS


fromPageEffect : Browser.Navigation.Key -> Effect PageMsg -> Cmd Msg
fromPageEffect key effect =
    Effect.toCmd
        { key = key
        , fromPageMsg = PageSent
        , fromSharedMsg = SharedSent
        }
        effect


fromSharedEffect : Browser.Navigation.Key -> Effect Shared.Msg -> Cmd Msg
fromSharedEffect key effect =
    Effect.toCmd
        { key = key
        , fromPageMsg = SharedSent
        , fromSharedMsg = SharedSent
        }
        effect