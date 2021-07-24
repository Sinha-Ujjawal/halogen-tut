module ExampleHtmlElements where

import Prelude
import Data.Maybe (Maybe, fromMaybe)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

html :: forall w i. HH.HTML w i
html =
  HH.div
    [ HP.id "root" ]
    [ HH.input
        [ HP.placeholder "Name" ]
    , HH.button
        [ HP.classes [ HH.ClassName "btn-primary" ]
        , HP.type_ HP.ButtonSubmit
        ]
        [ HH.text "Submit" ]
    ]

h1HelloWorld :: forall w i. HH.HTML w i
h1HelloWorld = HH.h1 [] [ HH.text "Hello, world" ]

inputEl :: forall w i. HH.HTML w i
inputEl = HH.input [ HP.placeholder "Name" ]

emptyText :: forall w i. HH.HTML w i
emptyText = HH.text ""

maybeEl :: forall w i a. Maybe a -> (a -> HH.HTML w i) -> HH.HTML w i
maybeEl val = fromMaybe emptyText <<< flip map val

renderName :: forall w i. Maybe String -> HH.HTML w i
renderName = flip maybeEl HH.text

whenEl :: forall w i. Boolean -> (Unit -> HH.HTML w i) -> HH.HTML w i
whenEl cond f = if cond then f unit else emptyText

renderOld :: forall w i. { old :: Number, new :: Number } -> HH.HTML w i
renderOld { old, new } =
  whenEl (old /= new) \_ ->
    HH.div_ [ HH.text $ show old ]
