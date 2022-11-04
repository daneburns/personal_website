module Route.Path exposing (Path(..), fromUrl, toString, href)

import Html
import Html.Attributes
import Url exposing (Url)
import Url.Parser exposing ((</>))


type Path
    = Home_
    | Work
    | NotFound_


fromUrl : Url -> Path
fromUrl url =
    Url.Parser.parse parser url
        |> Maybe.withDefault NotFound_


href : Path -> Html.Attribute msg
href path =
    Html.Attributes.href (toString path)


toString : Path -> String
toString path =
    let
        pieces =
            case path of
                Home_ ->
                    []

                Work ->
                    [ "work" ]

                NotFound_ ->
                    [ "404" ]
    in
    pieces
        |> String.join "/"
        |> String.append "/"


parser : Url.Parser.Parser (Path -> a) a
parser =
    Url.Parser.oneOf
        [ Url.Parser.map Home_ Url.Parser.top
        , Url.Parser.map Work (Url.Parser.s "work")
        ]