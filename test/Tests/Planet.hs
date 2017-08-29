module Tests.Planet where

import Test.Framework (Test, testGroup)
import Test.HUnit (Assertion, assertEqual)
import Test.Framework.Providers.HUnit (testCase)

import Bot (Heading(..))
import Planet (Planet)
import qualified Planet

planetTests :: Test
planetTests =
  testGroup "Planet Tests" [
    testCase "Planet can be created" test_planetCreation,
    testCase "Planet can have markers added" test_planetMarker
  ]

test_planetCreation :: Assertion
test_planetCreation =
  let
    w = 5
    h = 10
    result = Planet.create w h
    expected = Planet.create w h
  in
    assertEqual "" expected result

test_planetMarker :: Assertion
test_planetMarker =
  let
    coords = (4, 3)
    heading = North
    planet = Planet.addMarker (Planet.create 5 4) coords heading
    expected = True
  in
    assertEqual "" expected (Planet.checkMarker planet coords heading)

