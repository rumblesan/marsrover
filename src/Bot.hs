module Bot (
  Coord,
  Bot(..),
  Heading(..),
  commandBot
) where

import Commands (Command)
data Heading = North | East | South | West deriving (Eq, Show)

type Coord = (Int, Int)

data Bot = Bot {
  position :: Coord,
  heading :: Heading
} deriving (Eq, Show)

commandBot :: Bot -> Command -> Bot
commandBot = undefined

