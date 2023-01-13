module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.Blog
import Pages.Work
import Pages.NotFound_
import View exposing (View)


type Model
    = Home_
    | Blog
    | Work
    | NotFound_
    | Redirecting_
    | Loading_ (View Never)
