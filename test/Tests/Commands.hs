module Tests.Commands where

import Test.Framework (Test, testGroup)
import Test.HUnit (Assertion, assertEqual)
import Test.Framework.Providers.HUnit (testCase)

import Commands

commandTests :: Test
commandTests =
  testGroup "Command Tests" [
    testCase "Command can be parsed" test_commandParse
  ]

test_commandParse :: Assertion
test_commandParse =
  let
    c = 'F'
    result = readCommand c
    expected = Just MoveForward
  in
    do
      assertEqual "Forward Command can be parsed" (Just MoveForward) (readCommand 'F')
      assertEqual "Left Command can be parsed" (Just TurnLeft) (readCommand 'L')
      assertEqual "Right Command can be parsed" (Just TurnRight) (readCommand 'R')
      assertEqual "Anything else is a Nothing" Nothing (readCommand 'Q')
