module Tests.Bot where

import           Test.Framework                 (Test, testGroup)
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     (Assertion, assertEqual)

import qualified Bot
import           Commands
import           Headings

botTests :: Test
botTests =
  testGroup
    "Bot Tests"
    [ testCase "Bot turns correct directions" test_botTurning
    , testCase "Bot moves relative to heading" test_botMovement
    ]

test_botTurning :: Assertion
test_botTurning =
  let bot = Bot.create 1 1 North
      result = Bot.command bot TurnLeft
      expected = Bot.create 1 1 West
  in assertEqual "" expected result

test_botMovement :: Assertion
test_botMovement =
  let bot = Bot.create 1 1 East
      result = Bot.command bot MoveForward
      expected = Bot.create 2 1 East
  in assertEqual "" expected result
