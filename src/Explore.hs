module Explore (
  runBot,
  runMissions
) where

import Planet
import Bot
import Commands

runBot :: Planet -> Bot -> String -> (Planet, Either Bot Bot)
runBot planet bot commandString = undefined

runMissions :: Planet -> [(Bot, String)] -> [Either Bot Bot]
runMissions planet missions = undefined

