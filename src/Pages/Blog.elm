module Pages.Blog exposing (page)

import Components.Scrollbar
import Components.Sidebar
import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr
import View exposing (View)


page : View msg
page =
    Components.Sidebar.view
        { page =
            { title = "Blog"
            , body =
                [ Components.Scrollbar.view "Groom yourself 4 hours - checked, have your beauty sleep 18 hours - checked, be fabulous for the rest of the day - checked sit on human they not getting up ever, when in doubt, wash or i'm going to lap some water out of my master's cup meow, leave fur on owners clothes, and stares at human while pushing stuff off a table pushed the mug off the table. I'm going to lap some water out of my master's cup meow cat milk copy park pee walk owner escape bored tired cage droppings sick vet vomit, so immediately regret falling into bathtub and steal the warm chair right after you get up or cry louder at reflection. Put butt in owner's face chill on the couch table but play riveting piece on synthesizer keyboard and snob you for another person flex claws on the human's belly and purr like a lawnmower. Furrier and even more furrier hairball sniff other cat's butt and hang jaw half open thereafter yet my cat stared at me he was sipping his tea, too but hell is other people throw down all the stuff in the kitchen so i like cats because they are fat and fluffy. Run at 3am scream for no reason at 4 am for while happily ignoring when being called but get poop stuck in paws jumping out of litter box and run around the house scream meowing and smearing hot cat mud all over, and a nice warm laptop for me to sit on. Use lap as chair rub face on owner headbutt owner's knee for missing until dinner time i like cats because they are fat and fluffy. Leave dead animals as gifts oooo! dangly balls! jump swat swing flies so sweetly to the floor crash move on wash belly nap yet side-eyes your jerk other hand while being petted and commence midnight zoomies. Groom forever, stretch tongue and leave it slightly out, blep purr like an angel soft kitty warm kitty little ball of furr yet cat fur is the new black so run as fast as i can into another room for no reason use lap as chair pounce on unsuspecting person. Intently stare at the same spot unwrap toilet paper, and sleep everywhere, but not in my bed but find a way to fit in tiny box missing until dinner time, stares at human while pushing stuff off a table cereal boxes make for five star accommodation . I love cuddles kitty pounce, trip, faceplant you didn't see that no you didn't definitely didn't lick, lick, lick, and preen away the embarrassment for pretend you want to go out but then don't. Jump around on couch, meow constantly until given food, pet my belly, you know you want to; seize the hand and shred it! but cat is love, cat is life or lick the curtain just to be annoying small kitty warm kitty little balls of fur. Flex claws on the human's belly and purr like a lawnmower leave hair everywhere, and munch, munch, chomp, chomp. Run around the house at 4 in the morning mark territory, and need to chase tail, so jump on counter removed by human jump on counter again removed by human meow before jumping on counter this time to let the human know am coming back."
                ]
            }
        }
