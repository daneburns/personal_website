module Pages.Home_ exposing (page)

import Components.Sidebar
import Html exposing (a, div, h2, p, text)
import Html.Attributes exposing (class, href)
import View exposing (View)


page : View msg
page =
    Components.Sidebar.view
        { page =
            { title = "Home"
            , body =
                [ div []
                    [ h2 [ class "thin border heading" ] [ text "Dane Burns" ]
                    , p [ class "bodyText" ]
                        [ text "I am a software engineer and businessy person who is currently the CTO of "
                        , a [ href "https://telefi.app" ] [ text "telefi" ]
                        , text "."
                        ]
                    ]
                ]
            }
        }
