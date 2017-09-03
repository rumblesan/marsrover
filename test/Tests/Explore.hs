module Tests.Explore where

import           Test.Framework                 (Test, testGroup)
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     (Assertion, assertEqual)

import qualified Bot
import           Commands
import           Explore                        (Mission (..), runMission,
                                                 runMissions)
import qualified Planet

import           Control.Monad.State.Strict

exploreTests :: Test
exploreTests =
  testGroup
    "Explore Tests"
    [ testCase "Explore with single bot" test_runSingleBot
    , testCase "Send multiple missions" test_runMultipleMissions
    ]

test_runSingleBot :: Assertion
test_runSingleBot =
  let planet = Planet.create 5 3
      mission = Mission 1 1 Bot.East "RFRFRFRF"
      b = evalState (runMission mission) planet
      expected = Right $ Bot.create 1 1 Bot.East
  in assertEqual "" expected b

test_runMultipleMissions :: Assertion
test_runMultipleMissions =
  let planet = Planet.create 5 3
      missions =
        [ Mission 1 1 Bot.East "RFRFRFRF"
        , Mission 3 2 Bot.North "FRRFLLFFRRFLL"
        , Mission 0 3 Bot.West "LLFFFLFLFL"
        ]
      bots = evalState (runMissions missions) planet
      expected =
        [ Right $ Bot.create 1 1 Bot.East
        , Left $ Bot.create 3 3 Bot.North
        , Right $ Bot.create 2 3 Bot.South
        ]
  in assertEqual "" expected bots
