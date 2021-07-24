module Components.Counter (component) where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE

data Action
  = Incr
  | Decr

type Input
  = Unit

type State
  = Int

initialState :: forall a. a -> State
initialState = const 0

render :: forall m. State -> HH.ComponentHTML Action () m
render state =
  HH.div_
    [ HH.div_ [ HH.button [ HE.onClick $ const Decr ] [ HH.text "-" ] ]
    , HH.p_ [ HH.text (show state) ]
    , HH.div_ [ HH.button [ HE.onClick $ const Incr ] [ HH.text "+" ] ]
    ]

handleAction :: forall output m. Action -> H.HalogenM State Action () output m Unit
handleAction = case _ of
  Decr -> H.modify_ (_ - 1)
  Incr -> H.modify_ (_ + 1)

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }
