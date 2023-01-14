module Components.Sidebar exposing (view)

import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr
import View exposing (View)


heading : String -> Html msg
heading title =
    div [ Attr.class "heading" ] [ h2 [] [ text title ] ]


view : { page : View msg } -> View msg
view { page } =
    { title = page.title
    , body =
        [ Html.div [ Attr.class "layout" ]
            [ viewSidebar page.title
            , heading page.title
            , Html.div [ Attr.class "page" ] page.body
            ]
        ]
    }


viewSidebar : String -> Html msg
viewSidebar title =
    Html.nav [ Attr.class "sidebar italic" ]
        [ Html.a
            [ Attr.href "/"
            , Attr.class "navItem"
            , if title == "Home" then
                Attr.class "active"

              else
                Attr.class ""
            ]
            [ Html.text "Home" ]
        , Html.a
            [ Attr.href "/work"
            , Attr.class "navItem"
            , if title == "Work" then
                Attr.class "active"

              else
                Attr.class ""
            ]
            [ Html.text "Work" ]
        , Html.a
            [ Attr.href "/blog"
            , Attr.class "navItem"
            , if title == "Blog" then
                Attr.class "active"

              else
                Attr.class ""
            ]
            [ Html.text "Blog" ]
        ]
