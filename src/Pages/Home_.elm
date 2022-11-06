module Pages.Home_ exposing (page)

import Html exposing (Html, div, h1, text, nav, p)
import Html.Attributes exposing (class)
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body =
        [ div [ class "body" ]
            [ grid
                [ navbar
                , heading
               ]
            ]
        ]
    }


neon : Html msg
neon =
    h1 [ class "neonText" ] [ text "aww skeet skeet" ]


heading : Html msg
heading =
    div [class "grid-1"] [ h1 [ class "heading" ] [ text "Dane Burns" ] ]


grid : List (Html msg) -> Html msg
grid arg =
    div [ class "container" ] arg


navbar : Html msg
navbar =
    nav [ class "flex-row  grid-1 nav" ]
        [ p []  [ text "Home" ]
        , p [class "middleNav"] [ text "Work" ]
        , p [] [ text "About" ]
        ]
