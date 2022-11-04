module Pages.Work exposing (page)

import Html exposing (Html)
import View exposing (View)


page : View msg
page =
    { title = "Pages.Work"
    , body = [ Html.text "/work" ]
    }