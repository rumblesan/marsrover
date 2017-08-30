module Explore (
  runBot,
  runMissions
) where

import Control.Monad.State.Strict

import Planet
import Bot
import Commands

import Data.Maybe (catMaybes)

type Exploration v = State Planet v

runBot :: Bot -> String -> Exploration (Either Bot Bot)
runBot bot commandString =
  let
    commands = catMaybes $ readCommand <$> commandString
  in
    do
      finalBot <- gets (\planet -> foldM (runCommand planet) bot commands)
      case finalBot of
        Right finalBot -> return $ Right finalBot
        Left lostBot ->
          do
            modify (\planet -> addMarker planet (position lostBot))
            return $ Left lostBot


runCommand :: Planet -> Bot -> Command -> Either Bot Bot
runCommand planet bot command
  | checkCoords planet (position nextBot) = Right nextBot
  | checkMarker planet (position bot)     = Right bot
  | otherwise                             = Left bot
  where
    nextBot = commandBot bot command

runMissions :: [(Bot, String)] -> Exploration [Either Bot Bot]
runMissions missions = mapM (\(b, coms) -> runBot b coms) missions



