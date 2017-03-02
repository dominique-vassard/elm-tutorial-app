module Update exposing (update)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing exposing (parseLocation)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            ( { model | route = parseLocation location }, Cmd.none )
