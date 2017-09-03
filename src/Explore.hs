module Explore
  ( runMission
  , runMissions
  , missionReport
  , Mission(..)
  , FailedMission(..)
  , MissionResult
  ) where

import           Control.Monad.State.Strict

import           Bot                        (Bot)
import qualified Bot
import           Commands
import           Headings                   (Heading)
import           Planet                     (Planet)
import qualified Planet

newtype FailedMission =
  LostBot Bot
  deriving (Show, Eq)

type MissionResult = Either FailedMission Bot

type Exploration v = State Planet v

data Mission =
  Mission Int
          Int
          Heading
          [Command]
  deriving (Show, Eq)

runMission :: Mission -> Exploration MissionResult
runMission (Mission startX startY startHeading commands) =
  let bot = Bot.create startX startY startHeading
  in do finalBot <- gets (\planet -> foldM (runCommand planet) bot commands)
        case finalBot of
          Right finalBot -> return $ Right finalBot
          l@(Left (LostBot bot)) -> do
            modify (\planet -> Planet.addMarker planet (Bot.position bot))
            return l

runCommand :: Planet -> Bot -> Command -> MissionResult
runCommand planet bot command
  | Planet.checkCoords planet (Bot.position nextBot) = Right nextBot
  | Planet.checkMarker planet (Bot.position bot) = Right bot
  | otherwise = Left $ LostBot bot
  where
    nextBot = Bot.command bot command

runMissions :: [Mission] -> Exploration [MissionResult]
runMissions = mapM runMission

missionReport :: MissionResult -> String
missionReport (Right bot)          = show bot
missionReport (Left (LostBot bot)) = show bot ++ " LOST"
