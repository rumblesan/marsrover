module Planet (
  Planet,
  create,
  addMarker,
  checkMarker,
  checkCoords
) where

import Data.Set (Set)
import qualified Data.Set as Set

import Bot (Coord, Heading)

data Planet = Planet {
  width :: Int,
  height :: Int,
  markers :: Set Coord
} deriving (Show, Eq)

create :: Int -> Int -> Planet
create w h = Planet { width = w, height = h, markers = Set.empty }

addMarker :: Planet -> Coord -> Planet
addMarker planet coord =
    planet { markers = Set.insert coord $ markers planet }

checkMarker :: Planet -> Coord -> Bool
checkMarker planet coord =
    Set.member coord $ markers planet

checkCoords :: Planet -> Coord -> Bool
checkCoords (Planet w h _) (x, y) = x < w && x >= 0 && y < h && y >= 0

