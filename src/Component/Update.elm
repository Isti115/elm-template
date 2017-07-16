module Component.Update exposing (update)

import Component.Types
    exposing
        ( GrabState(Grabbed, Released)
        , Model
        , Msg(Grab, Move, Release)
        )


update : Msg -> Model -> Model
update msg model =
    case msg of
        Grab ->
            { model | grabState = Grabbed }

        Move position ->
            { model | position = position }

        Release ->
            { model | grabState = Released }
