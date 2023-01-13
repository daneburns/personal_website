module Pages.Blog exposing (page)

import Components.Sidebar
import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr
import View exposing (View)


heading arg =
    div [] [ h2 [ Attr.class "thin border" ] [ text "My Blog" ] ]


page : View msg
page =
    Components.Sidebar.view
        { page =
            { title = "Dane Burns  - Blog"
            , body = [ heading "/blog" ]
            }
        }
