module Tests.Bot where

import Test.Framework (Test, testGroup)
import Test.HUnit (Assertion, assertEqual)
import Test.Framework.Providers.HUnit (testCase)

import Bot
import Commands

botTests :: Test
botTests =
  testGroup "Bot Tests" [
    testCase "Bot turns correct directions" test_botTurning,
    testCase "Bot moves relative to heading" test_botMovement
  ]


test_botTurning :: Assertion
test_botTurning =
  let
    bot = Bot { position = (1, 1), heading = North }
    result = commandBot bot TurnLeft
    expected = Bot { position = (1, 1), heading = West }
  in
    assertEqual "" expected result

test_botMovement :: Assertion
test_botMovement =
  let
    bot = Bot { position = (1, 1), heading = East }
    result = commandBot bot MoveForward
    expected = Bot { position = (2, 1), heading = East }
  in
    assertEqual "" expected result
