module Components.Scrollbar exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr
import View exposing (View)


view : String -> Html msg
view content =
    Html.p [ Attr.class "bodyText" ] [ Html.text content ]
