module Tests.Explore where

import Test.Framework (Test, testGroup)
import Test.HUnit (Assertion, assertEqual)
import Test.Framework.Providers.HUnit (testCase)

import qualified Bot
import qualified Planet
import Commands
import Explore

exploreTests :: Test
exploreTests =
  testGroup "Explore Tests" [
    testCase "Explore with single bot" test_runSingleBot,
    testCase "Send multiple missions" test_runMultipleMissions
  ]


test_runSingleBot :: Assertion
test_runSingleBot =
  let
    planet = Planet.create 5 3
    bot = Bot.create 1 1 Bot.East
    commands = "RFRFRFRF"
    (_, b) = runBot planet bot commands
    expected = Right $ Bot.create 1 1 Bot.East
  in
    assertEqual "" expected b

test_runMultipleMissions :: Assertion
test_runMultipleMissions =
  let
    planet = Planet.create 5 3
    missions = [ (Bot.create 1 1 Bot.East, "RFRFRFRF"), (Bot.create 3 2 Bot.North, "FRRFLLFFRRFLL"), (Bot.create 0 3 Bot.West, "LLFFFLFLFL") ]
    bots = runMissions planet missions
    expected = [ Right $ Bot.create 1 1 Bot.East, Left $ Bot.create 3 3 Bot.North, Right $ Bot.create 2 3 Bot.South ]
  in
    assertEqual "" expected bots

