module Pages.Home_ exposing (page)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body = [ div [ class "body" ] (grid [ div [] [ heading ] ]) ]
    }


neon : Html msg
neon =
    h1 [ class "neonText" ] [ text "aww skeet skeet" ]


heading : Html msg
heading =
    div [] [ h1 [ class "heading fullWidth" ] [ text "Dane Burns" ] ]


grid : List (Html msg) -> List (Html msg)
grid arg =
    [ div [ class "container" ] arg ]
