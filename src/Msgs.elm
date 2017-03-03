module Msgs exposing (..)

import Models exposing (Player)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = OnFetchPlayers (WebData (List Player))
    | ChangeLocation String
    | OnLocationChange Location
