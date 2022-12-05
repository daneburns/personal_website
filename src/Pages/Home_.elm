module Pages.Home_ exposing (page)

import Html exposing (a, div, h1, p, text)
import Html.Attributes exposing (class, href)
import Layout exposing (Layout)
import View exposing (View)


layout : Layout
layout =
    Layout.Sidebar


page : View msg
page =
    { title = "Homepage"
    , body =
        [ div []
            [ h1 [ class "thin border" ] [ text "Dane Burns" ]
            , p []
                [ text "I am a software engineer and businessy person who is currently the CTO of "
                , a [ href "https://telefi.app" ] [ text "telefi" ]
                , text "."
                ]
            ]
        ]
    }
