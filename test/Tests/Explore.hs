module Tests.Explore where

import           Data.Maybe                     (catMaybes)
import           Test.Framework                 (Test, testGroup)
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     (Assertion, assertEqual)

import qualified Bot
import           Commands
import           Explore                        (FailedMission (..),
                                                 Mission (..), runMission,
                                                 runMissions)
import           Headings                       (Heading (..))
import qualified Planet

import           Control.Monad.State.Strict

parseCommandString :: String -> [Command]
parseCommandString commandString = catMaybes $ readCommand <$> commandString

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
      mission = Mission 1 1 East $ parseCommandString "RFRFRFRF"
      b = evalState (runMission mission) planet
      expected = Right $ Bot.create 1 1 East
  in assertEqual "" expected b

test_runMultipleMissions :: Assertion
test_runMultipleMissions =
  let planet = Planet.create 5 3
      missions =
        [ Mission 1 1 East $ parseCommandString "RFRFRFRF"
        , Mission 3 2 North $ parseCommandString "FRRFLLFFRRFLL"
        , Mission 0 3 West $ parseCommandString "LLFFFLFLFL"
        ]
      bots = evalState (runMissions missions) planet
      expected =
        [ Right $ Bot.create 1 1 East
        , Left $ LostBot $ Bot.create 3 3 North
        , Right $ Bot.create 2 3 South
        ]
  in assertEqual "" expected bots
