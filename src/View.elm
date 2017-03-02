module View exposing (view)

import Html exposing (Html, div, text, program)
import Msgs exposing (Msg)
import Models exposing (Model, PlayerId)
import Players.List exposing (view)
import Players.Edit exposing (view)
import RemoteData


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.PlayersRoute ->
            Players.List.view model.players

        Models.PlayerRoute id ->
            playerEditPage model id

        Models.NotFoundRoute ->
            notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
    case model.players of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success players ->
            let
                maybePlayers =
                    players
                        |> List.filter (\player -> player.id == playerId)
                        |> List.head
            in
                case maybePlayers of
                    Just player ->
                        Players.Edit.view player

                    Nothing ->
                        notFoundView

        RemoteData.Failure error ->
            text (toString error)


notFoundView : Html Msg
notFoundView =
    div [] [ text "Not Found" ]
