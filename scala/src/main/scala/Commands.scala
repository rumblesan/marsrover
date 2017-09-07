package com.rumblesan.marsrover

object Commands {

  sealed trait Command
  case object TurnLeft extends Command
  case object MoveForward extends Command
  case object TurnRight extends Command

  def parse(c: Char): Option[Command] = {
    c match {
      case 'L' => Some(TurnLeft)
      case 'F' => Some(MoveForward)
      case 'R' => Some(TurnRight)
      case _ => None
    }
  }

}
