module Commands
  ( Command(..)
  , readCommand
  ) where

data Command
  = TurnLeft
  | MoveForward
  | TurnRight
  deriving (Show, Eq)

readCommand :: Char -> Maybe Command
readCommand 'L' = Just TurnLeft
readCommand 'R' = Just TurnRight
readCommand 'F' = Just MoveForward
readCommand _   = Nothing
