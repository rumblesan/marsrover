module Planet (
  Planet,
  create,
  addMarker,
  checkMarker,
) where

import Data.Set (Set)
import qualified Data.Set as Set

import Bot (Coord, Heading)

data Planet = Planet {
  width :: Int,
  height :: Int,
  markers :: Set (Coord, Heading)
} deriving (Show, Eq)

create :: Int -> Int -> Planet
create w h = Planet { width = w, height = h, markers = Set.empty }

addMarker :: Planet -> Coord -> Heading -> Planet
addMarker planet coord direction =
  let
    marker = (coord, direction)
  in
    planet { markers = Set.insert marker $ markers planet }

checkMarker :: Planet -> Coord -> Heading -> Bool
checkMarker planet coord direction =
  let
    marker = (coord, direction)
  in
    Set.member marker $ markers planet

