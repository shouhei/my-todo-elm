import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

main =
    Html.beginnerProgram
        {
            model = model,
            view = view,
            update = update
        }


type alias Model = { token:String }

model : Model
model =
  Model ""


type Msg = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change new ->
      { model | token = new }

view : Model -> Html Msg
view model =
  div []
    [
     input [ placeholder "This show text", onInput Change ] []
    , div [] [ text ("curl --header \"PRIVATE-TOKEN: " ++ model.token ++ "\" https://gitlab.com/api/v4/snippets") ]
    ]
