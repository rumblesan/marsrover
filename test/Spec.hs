module Main where

import Test.Framework

import Data.Monoid

import Tests.Bot (botTests)
import Tests.Planet (planetTests)

main :: IO ()
main =
  defaultMainWithOpts
    [
      botTests,
      planetTests
    ]
    mempty

