module Explore (
  runMission,
  runMissions,
  Mission(..)
) where

import Control.Monad.State.Strict

import Planet (Planet)
import qualified Planet
import Bot (Bot)
import qualified Bot
import Commands

import Data.Maybe (catMaybes)

type Exploration v = State Planet v
data Mission = Mission Int Int Bot.Heading String deriving (Show, Eq)

runMission :: Mission -> Exploration (Either Bot Bot)
runMission (Mission startX startY startHeading commandString)  =
  let
    commands = catMaybes $ readCommand <$> commandString
    bot = Bot.create startX startY startHeading
  in
    do
      finalBot <- gets (\planet -> foldM (runCommand planet) bot commands)
      case finalBot of
        Right finalBot -> return $ Right finalBot
        Left lostBot ->
          do
            modify (\planet -> Planet.addMarker planet (Bot.position lostBot))
            return $ Left lostBot


runCommand :: Planet -> Bot -> Command -> Either Bot Bot
runCommand planet bot command
  | Planet.checkCoords planet (Bot.position nextBot) = Right nextBot
  | Planet.checkMarker planet (Bot.position bot)     = Right bot
  | otherwise                                        = Left bot
  where
    nextBot = Bot.commandBot bot command

runMissions :: [Mission] -> Exploration [Either Bot Bot]
runMissions = mapM runMission



