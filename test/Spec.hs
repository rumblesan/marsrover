module Main where

import Test.Framework

import Data.Monoid

import Tests.Bot (botTests)

main :: IO ()
main =
  defaultMainWithOpts
    [
      botTests
    ]
    mempty

