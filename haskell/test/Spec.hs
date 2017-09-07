module Main where

import           Test.Framework

import           Data.Monoid

import           Tests.Bot      (botTests)
import           Tests.Commands (commandTests)
import           Tests.Explore  (exploreTests)
import           Tests.Planet   (planetTests)

main :: IO ()
main =
  defaultMainWithOpts [botTests, planetTests, commandTests, exploreTests] mempty
