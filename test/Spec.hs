module Main where

import Test.Framework

import Data.Monoid

import Tests.Bot (botTests)
import Tests.Planet (planetTests)
import Tests.Commands (commandTests)

main :: IO ()
main =
  defaultMainWithOpts
    [
      botTests,
      planetTests,
      commandTests
    ]
    mempty

