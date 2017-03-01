module Main exposing (..)

import Html exposing (program)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Commands exposing (fetchPlayers)


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchPlayers )
