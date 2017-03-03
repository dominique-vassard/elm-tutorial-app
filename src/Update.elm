module Update exposing (update)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing exposing (parseLocation)
import Navigation exposing (newUrl)


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
