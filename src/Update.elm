module Update exposing (update)

import Msgs exposing (Msg)
import Models exposing (Model)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )
