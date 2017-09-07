package com.rumblesan.marsrover

object Headings {

  sealed trait Heading
  case object North extends Heading
  case object East extends Heading
  case object South extends Heading
  case object West extends Heading

  def parse(c: Char): Option[Heading] = {
    c match {
      case 'N' => Some(North)
      case 'E' => Some(North)
      case 'S' => Some(North)
      case 'W' => Some(North)
      case _ => None
    }
  }

}
