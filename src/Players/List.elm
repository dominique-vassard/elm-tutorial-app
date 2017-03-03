module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Player)
import RemoteData exposing (WebData)
import Routing exposing (playerPath)
import Helpers.View exposing (onLinkClick)


view : WebData (List Player) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Players" ] ]


maybeList : WebData (List Player) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success players ->
            list players

        RemoteData.Failure error ->
            text (toString error)


list : List Player -> Html Msg
list players =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ td [] [ text "Id" ]
                    , td [] [ text "Name" ]
                    , td [] [ text "Level" ]
                    , td [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map playerRow players)
            ]
        ]


playerRow : Player -> Html Msg
playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text (toString player.level) ]
        , td []
            [ editBtn player ]
        ]


editBtn : Player -> Html Msg
editBtn player =
    let
        path =
            playerPath player.id
    in
        a
            [ class "btn regular", href path, onLinkClick (Msgs.ChangeLocation path) ]
            [ i [ class "fa fa-pencil mr1" ] []
            , text "Edit"
            ]
