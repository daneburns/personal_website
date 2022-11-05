module Pages.Work exposing (page)

import Html exposing (Html, div, h1, text)
import Html.Attributes as Attr
import View exposing (View)


heading arg =
    div [ Attr.class "heading" ] [ text "hey there friend" ]


page : View msg
page =
    { title = "Pages.Work"
    , body = [ heading "/work" ]
    }
