module Main where

import Prelude
import Affjax as AX
import Affjax.ResponseFormat as AXRF
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (log)
import Components.Counter as Counter
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main =
  HA.runHalogenAff do
    body <- HA.awaitBody
    runUI Counter.component unit body

-- type Count
--   = { count :: Int, name :: String }
-- setCount :: Int -> Count -> Count
-- setCount count = _ { count = count }
-- main :: Effect Unit
-- main = do
--   let
--     c = { count: 0, name: "My shiny counter" }
--   log $ show c
--   log $ show $ setCount 5 c
--   launchAff_ do
--     result <- AX.get AXRF.string "https://www.google.com/"
--     case result of
--       Left err -> log $ "Some error occured " <> AX.printError err
--       Right response -> log $ "response: " <> response.body
