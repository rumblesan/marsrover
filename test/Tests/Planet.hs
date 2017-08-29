module Tests.Planet where

import Test.Framework (Test, testGroup)
import Test.HUnit (Assertion, assertEqual)
import Test.Framework.Providers.HUnit (testCase)

import Planet

planetTests :: Test
planetTests =
  testGroup "Planet Tests" [
    testCase "Planet can be created" test_planetCreation
  ]

test_planetCreation :: Assertion
test_planetCreation =
  let
    result = False
    expected = True
  in
    assertEqual "" expected result

