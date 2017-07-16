module Config
    exposing
        ( component1Initializer
        , component2Initializer
        )

import Component.Types


component1Initializer : Component.Types.Initializer
component1Initializer =
    { position =
        { x = 50
        , y = 50
        }
    }


component2Initializer : Component.Types.Initializer
component2Initializer =
    { position =
        { x = 25
        , y = 75
        }
    }
