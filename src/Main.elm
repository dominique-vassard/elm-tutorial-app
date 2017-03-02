module Main exposing (..)

import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Commands exposing (fetchPlayers)
import Navigation exposing (Location)
import Routing


-- MAIN


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : Location -> ( Model, Cmd Msg )
init location =
    ( initialModel (Routing.parseLocation location), fetchPlayers )
