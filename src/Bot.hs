module Bot (
  Coord,
  Bot(..),
  Heading(..),
  create,
  commandBot
) where

import Commands
data Heading = North | East | South | West deriving (Eq, Ord, Read)

instance Show Heading where
  show North = "N"
  show South = "S"
  show East = "E"
  show West = "W"

type Coord = (Int, Int)

data Bot = Bot {
  position :: Coord,
  heading :: Heading
} deriving (Eq)

instance Show Bot where
  show bot =
    let
      (x, y) = position bot
    in
      show x ++ " " ++ show y ++ " " ++ show (heading bot)

create :: Int -> Int -> Heading -> Bot
create x y h = Bot { position = (x, y), heading = h }

commandBot :: Bot -> Command -> Bot
commandBot bot command =
  case command of TurnLeft -> bot { heading = turnLeft $ heading bot }
                  TurnRight -> bot { heading = turnRight $ heading bot }
                  MoveForward -> bot { position = moveForward (heading bot) (position bot) }

turnLeft :: Heading -> Heading
turnLeft North = West
turnLeft East = North
turnLeft South = East
turnLeft West = South

turnRight :: Heading -> Heading
turnRight North = East
turnRight East = South
turnRight South = West
turnRight West = North

moveForward :: Heading -> Coord -> Coord
moveForward North (x, y) = (x, y + 1)
moveForward East (x, y) = (x + 1, y)
moveForward South (x, y) = (x, y - 1)
moveForward West (x, y) = (x - 1, y)
