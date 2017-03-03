module Update exposing (update)

import Msgs exposing (Msg)
import Models exposing (Model, Player)
import Commands exposing (savePlayerCmd)
import Routing exposing (parseLocation)
import Navigation exposing (newUrl)
import RemoteData


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.ChangeLocation location ->
            ( { model | routeChanges = model.routeChanges + 1 }, Navigation.newUrl location )

        Msgs.OnLocationChange location ->
            ( { model | route = parseLocation location }, Cmd.none )

        Msgs.ChangeLevel player newLevel ->
            let
                newPlayer =
                    { player | level = player.level + newLevel }
            in
                ( model, savePlayerCmd newPlayer )

        Msgs.OnPlayerSave (Ok player) ->
            ( updatePlayer model player, Cmd.none )

        Msgs.OnPlayerSave (Err err) ->
            ( model, Cmd.none )


updatePlayer : Model -> Player -> Model
updatePlayer model updatedPlayer =
    let
        pick currentPlayer =
            if updatedPlayer.id == currentPlayer.id then
                updatedPlayer
            else
                currentPlayer

        updatePlayerList players =
            List.map pick players

        updatedPlayers =
            RemoteData.map updatePlayerList model.players
    in
        { model | players = updatedPlayers }
