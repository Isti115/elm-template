module Component.Types
    exposing
        ( Coordinate
        , GrabState(Grabbed, Released)
        , Initializer
        , Model
        , Msg(Grab, Move, Release)
        , Position
        )


type alias Coordinate =
    Int


type alias Position =
    { x : Coordinate
    , y : Coordinate
    }


type GrabState
    = Grabbed
    | Released


type alias Initializer =
    { position : Position
    }


type alias Model =
    { position : Position
    , grabState : GrabState
    }


type Msg
    = Grab
    | Move Position
    | Release
