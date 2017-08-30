module Main where

import Control.Monad.State.Strict

import Planet (Planet)
import qualified Planet

import Explore (Mission(..), runMission)

main :: IO ()
main = do
  putStrLn "Let's explore Mars"
  putStrLn "What's the width? (Single integer)"
  w <- read <$> getLine
  putStrLn "What's the height? (Single integer)"
  h <- read <$> getLine
  putStrLn "What's the Robots x starting position? (Single integer)"
  x <- read <$> getLine
  putStrLn "What's the Robots y starting position? (Single integer)"
  y <- read <$> getLine
  putStrLn "What's the Robots starting heading? (North, South, East, West)"
  heading <- read <$> getLine
  putStrLn "What's the Robots command string? (Any combo of L, R and/or F)"
  commands <- getLine
  let
    planet = Planet.create w h
    mission = Mission x y heading commands
    result = evalState (runMission mission) planet
  print result


