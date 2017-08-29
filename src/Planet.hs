module Planet (
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
create = undefined

addMarker :: Planet -> Coord -> Heading -> Planet
addMarker = undefined

checkMarker :: Planet -> Coord -> Heading -> Bool
checkMarker = undefined

