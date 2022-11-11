module Pages.Home_ exposing (page)

import Html exposing (Html, div, h1, img, nav, p, text)
import Html.Attributes exposing (class, src)
import Layout exposing (Layout)
import View exposing (View)


layout : Layout
layout =
    Layout.Sidebar


page : View msg
page =
    { title = "Homepage"
    , body =
        [ div [] [ h1 [] [ text "Dane Burns" ] ]
        , div [] []
        , div [] [ div [ class "avatar" ] [] ]
        ]
    }
