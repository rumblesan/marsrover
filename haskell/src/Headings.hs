module Headings
  ( Heading(..)
  , readHeading
  ) where

data Heading
  = North
  | East
  | South
  | West
  deriving (Eq, Ord, Read)

instance Show Heading where
  show North = "N"
  show East  = "E"
  show South = "S"
  show West  = "W"

readHeading :: Char -> Maybe Heading
readHeading 'N' = Just North
readHeading 'E' = Just East
readHeading 'S' = Just South
readHeading 'W' = Just West
readHeading _   = Nothing
