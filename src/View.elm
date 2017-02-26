module View exposing (view)

import Html exposing (Html, div, text, program)
import Msgs exposing (..)
import Models exposing (Model)


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]
