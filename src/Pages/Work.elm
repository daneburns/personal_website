module Pages.Work exposing (page)

import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr
import Layout exposing (Layout)
import View exposing (View)


layout : Layout
layout =
    Layout.Sidebar


heading arg =
    div [] [ h2 [Attr.class "thin border"] [ text "Github Stuff" ] ]


page : View msg
page =
    { title = "Pages.Work"
    , body = [ heading "/work" ]
    }
