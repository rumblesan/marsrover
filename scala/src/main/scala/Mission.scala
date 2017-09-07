package com.rumblesan.marsrover

import cats._
import cats.instances.list._
import cats.instances.either._

import Commands.Command
import Headings.Heading

case class Mission(startX: Int, startY: Int, startHeading: Heading, commands: List[Command])

object Mission {

  sealed trait FailedMissionResult
  case class LostBot(bot: Bot) extends FailedMissionResult

  type MissionResult[Result] = Either[FailedMissionResult, Result]

  def run(mission: Mission, planet: Planet): MissionResult[Bot] = {
    val startBot = Bot(mission.startX, mission.startY, mission.startHeading)
    Foldable[List].foldM[MissionResult, Command, Bot](mission.commands, startBot)(commandBot(planet))
  }

  def commandBot(planet: Planet)(bot: Bot, command: Command) = {
    val newBot = Bot.command(bot, command)
    if (Planet.validPosition(planet, newBot.xPos, newBot.yPos)) {
      Right(newBot)
    } else if (Planet.checkMarker(planet, bot.xPos, bot.yPos)) {
      // Skip command
      Right(bot)
    } else {
      // Return last valid bot
      Left(LostBot(bot))
    }
  }

}


