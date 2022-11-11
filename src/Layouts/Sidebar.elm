module Layouts.Sidebar exposing (layout)

import Html exposing (Html)
import Html.Attributes as Attr
import Page exposing (Page)
import View exposing (View)


layout : { page : View msg } -> View msg
layout { page } =
    { title = page.title
    , body =
        [ viewSidebar
        , Html.div [ Attr.class "layout" ] page.body
        ]
    }


viewSidebar : Html msg
viewSidebar =
    Html.nav [ Attr.class "sidebar" ]
        [ Html.a [ Attr.href "/" ] [ Html.h3 [] [ Html.text "Home" ] ]
        , Html.a [ Attr.href "/work" ] [ Html.h3 [] [ Html.text "Work" ] ]
        , Html.a [ Attr.href "/blog" ] [ Html.h3 [] [ Html.text "Blog" ] ]
        ]
