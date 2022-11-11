module Pages.Blog exposing (page)

import Html exposing (Html, div, h1, text)
import Html.Attributes as Attr
import Layout exposing (Layout)
import View exposing (View)


layout : Layout
layout =
    Layout.Sidebar


heading arg =
    div [ Attr.class "heading" ] [ h1 [] [ text "My Blog" ] ]


page : View msg
page =
    { title = "Pages.Blog"
    , body = [ heading "/blog" ]
    }

