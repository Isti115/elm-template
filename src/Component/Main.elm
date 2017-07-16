module Component.Main
    exposing
        ( Model
        , Msg
        , init
        , subscriptions
        , update
        , view
        )

import Component.Types
import Component.Update
import Html
import Html.Attributes


-- INIT


type alias Model =
    Component.Types.Model


init : Component.Types.Initializer -> ( Model, Cmd Msg )
init initializer =
    { position = initializer.position, grabState = Component.Types.Released } ! []



-- VIEW


view : Model -> Html.Html Msg
view model =
    Html.div
        [ Html.Attributes.style
            [ ( "width", "250px" )
            , ( "height", "250px" )
            , ( "background-color", "rgb(255, 100, 100)" )
            , ( "margin", "50px" )
            , ( "border", "3px solid black" )
            ]
        ]
        []



-- UPDATE


type alias Msg =
    Component.Types.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    Component.Update.update msg model ! []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
