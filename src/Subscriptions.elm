module Subscriptions exposing (subscriptions)

import Msgs exposing (Msg)
import Models exposing (Model)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
