module Main where

import           Control.Monad              (mapM_)
import           Control.Monad.State.Strict
import qualified Data.List                  as L
import           Data.Maybe                 (catMaybes)

import           Bot                        (Bot)
import           Commands                   (readCommand)
import           Planet                     (Planet)
import qualified Planet

import           Explore                    (Mission (..), MissionResult,
                                             missionReport, runMissions)

main :: IO ()
main = do
  putStrLn "Let's explore Mars"
  planet <- getPlanetData
  missions <- getMissionData []
  printMissionReports $ evalState (runMissions missions) planet

getPlanetData :: IO Planet
getPlanetData = do
  putStrLn "What's the width? (Single integer)"
  w <- read <$> getLine
  putStrLn "What's the height? (Single integer)"
  h <- read <$> getLine
  return $ Planet.create w h

getMissionData :: [Mission] -> IO [Mission]
getMissionData prevMissions = do
  putStrLn "\n**** New Mission"
  putStrLn "What's the Robots x starting position? (Single integer)"
  x <- read <$> getLine
  putStrLn "What's the Robots y starting position? (Single integer)"
  y <- read <$> getLine
  putStrLn "What's the Robots starting heading? (North, South, East, West)"
  heading <- read <$> getLine
  putStrLn "What's the Robots command string? (Any combo of L, R and/or F)"
  commands <- catMaybes . fmap readCommand <$> getLine
  let mission = Mission x y heading commands
  putStrLn "Is there another Mission? (y/n)"
  another <- getLine
  if another == "y"
    then getMissionData $ mission : prevMissions
    else return $ L.reverse $ mission : prevMissions

printMissionReports :: [MissionResult] -> IO ()
printMissionReports results = do
  putStrLn "\n************ Reports"
  mapM_ (putStrLn . missionReport) results
