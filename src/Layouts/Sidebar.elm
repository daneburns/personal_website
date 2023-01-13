module Layouts.Sidebar exposing (layout)

import Html exposing (Html)
import Html.Attributes as Attr
import Page exposing (Page)
import View exposing (View)


layout : { page : View msg } -> View msg
layout { page } =
    { title = page.title
    , body =
        [ Html.div [ Attr.class "layout" ]
            [ viewSidebar
            , Html.div [ Attr.class "page" ] page.body
            ]
        ]
    }


viewSidebar : Html msg
viewSidebar =
    Html.nav [ Attr.class "sidebar italic" ]
        [ Html.h3 [] [ Html.a [ Attr.href "/" ] [ Html.text "Home" ] ]
        , Html.h3 [] [ Html.a [ Attr.href "/work" ] [ Html.text "Work" ] ]
        , Html.h3 [] [ Html.a [ Attr.href "/blog" ] [ Html.text "Blog" ] ]
        ]
