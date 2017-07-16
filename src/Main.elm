port module Main exposing (..)

import Component.Main as Component
import Component.Types
import Config
import Html


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { component1Model : Component.Model
    , component2Model : Component.Model
    }


init : ( Model, Cmd Msg )
init =
    let
        ( component1Model, component1Cmd ) =
            Component.init Config.component1Initializer

        ( component2Model, component2Cmd ) =
            Component.init Config.component2Initializer
    in
    { component1Model = component1Model
    , component2Model = component2Model
    }
        ! [ Cmd.map Component1Msg component1Cmd
          , Cmd.map Component2Msg component2Cmd
          ]



-- VIEW


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.map Component1Msg (Component.view model.component1Model)
        , Html.hr [] []
        , Html.map Component2Msg (Component.view model.component2Model)
        ]



-- UPDATE


type Msg
    = Component1Msg Component.Msg
    | Component2Msg Component.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Component1Msg component1Msg ->
            let
                ( component1Model, component1Cmd ) =
                    Component.update component1Msg model.component1Model
            in
            { model | component1Model = component1Model } ! [ Cmd.map Component1Msg component1Cmd ]

        Component2Msg component2Msg ->
            let
                ( component2Model, component2Cmd ) =
                    Component.update component2Msg model.component2Model
            in
            { model | component2Model = component2Model } ! [ Cmd.map Component2Msg component2Cmd ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map Component1Msg (Component.subscriptions model.component1Model)
        , Sub.map Component2Msg (Component.subscriptions model.component2Model)
        ]
