module Helpers.View exposing (onLinkClick)

import Html exposing (..)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode exposing (succeed)


onLinkClick : a -> Attribute a
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
        onWithOptions "click" options (Decode.succeed message)
