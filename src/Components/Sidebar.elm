module Components.Sidebar exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr
import View exposing (View)


view : { page : View msg } -> View msg
view { page } =
    { title = page.title
    , body =
        [ Html.div [ Attr.class "layout" ]
            [ viewSidebar page.title
            , Html.div [ Attr.class "page" ] page.body
            ]
        ]
    }


viewSidebar : String -> Html msg
viewSidebar title =
    Html.nav [ Attr.class "sidebar italic" ]
        [ Html.div [Attr.class "mb-lg"] [ Html.text "Dane Burns" ]
        , Html.div [ Attr.class "space-y-lg" ]
            [ Html.h3 []
                [ Html.a
                    [ Attr.href "/"
                    , if title == "Home" then
                        Attr.class "active"

                      else
                        Attr.class ""
                    ]
                    [ Html.text "Home" ]
                ]
            , Html.h3 []
                [ Html.a
                    [ Attr.href "/work"
                    , if title == "Work" then
                        Attr.class "active"

                      else
                        Attr.class ""
                    ]
                    [ Html.text "Work" ]
                ]
            , Html.h3 []
                [ Html.a
                    [ Attr.href "/blog"
                    , if title == "Blog" then
                        Attr.class "active"

                      else
                        Attr.class ""
                    ]
                    [ Html.text "Blog" ]
                ]
            ]
        ]
