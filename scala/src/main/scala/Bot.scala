package com.rumblesan.marsrover

import Commands.{ Command, TurnLeft, MoveForward, TurnRight }
import Headings.{ Heading, North, East, South, West }

case class Bot(xPos: Int, yPos: Int, heading: Heading)

object Bot {

  def command(bot: Bot, command: Command): Bot = {
    command match {
      case TurnLeft => turnLeft(bot)
      case MoveForward => moveForward(bot)
      case TurnRight => turnRight(bot)
    }
  }

  def turnLeft(bot: Bot): Bot = {
    val newHeading = bot.heading match {
      case North => West
      case East => North
      case South => East
      case West => South
    }
    bot.copy(heading = newHeading)
  }

  def turnRight(bot: Bot): Bot = {
    val newHeading = bot.heading match {
      case North => East
      case East => South
      case South => West
      case West => North
    }
    bot.copy(heading = newHeading)
  }

  def moveForward(bot: Bot): Bot = {
    bot.heading match {
      case North => bot.copy(yPos = bot.yPos + 1)
      case East => bot.copy(xPos = bot.xPos + 1)
      case South => bot.copy(yPos = bot.yPos - 1)
      case West => bot.copy(xPos = bot.xPos - 1)
    }
  }

}

