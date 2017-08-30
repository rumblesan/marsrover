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
    testCase "Planet can have markers added" test_planetMarker,
    testCase "Coords can be checked for validity" test_checkCoords
  ]

test_planetCreation :: Assertion
test_planetCreation =
  let
    w = 5
    h = 10
    result = Planet.create w h
    expected = Planet.create w h
  in
    assertEqual "Planet can be created" expected result

test_planetMarker :: Assertion
test_planetMarker =
  let
    incoords = (4, 3)
    outcoords = (3, 3)
    heading = North
    planet = Planet.addMarker (Planet.create 5 4) incoords heading
  in
    do
      assertEqual "Marker exists" True (Planet.checkMarker planet incoords heading)
      assertEqual "Marker does not exist" False (Planet.checkMarker planet outcoords heading)

test_checkCoords :: Assertion
test_checkCoords =
  let
    planet = Planet.create 5 5
    badCoords = (7, 3)
    goodCoords = (1, 1)
    negativeCoords = (-1, 2)
  in
    do
      assertEqual "Bad coords are caught" False (Planet.checkCoords planet badCoords)
      assertEqual "Good coords are ok" True (Planet.checkCoords planet goodCoords)
      assertEqual "Negative coords are caught" False (Planet.checkCoords planet negativeCoords)
