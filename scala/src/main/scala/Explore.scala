package com.rumblesan.marsrover

import cats._
import cats.data._
import cats.instances.list._

import Mission.{MissionResult, FailedMissionResult, LostBot}


object Explore {

  type Exploration[Result] = State[Planet, Result]

  type MultipleExplorations[Result] = List[Exploration[Result]]

  def run(planet: Planet, missions: List[Mission]): List[MissionResult[Bot]] = {
    setup(missions).runA(planet).value
  }

  def setup(missions: List[Mission]): Exploration[List[MissionResult[Bot]]] = {
    Monad[Exploration].sequence[List, MissionResult[Bot]](
      missions.map((mission) => {
        for {
          missionResult <- State.inspect[Planet, MissionResult[Bot]](planet => Mission.run(mission, planet))
          result <- handleChanges(missionResult)
        } yield result
      })
    )
  }

  def handleChanges(result: MissionResult[Bot]): Exploration[MissionResult[Bot]] = {
    result match {
      case Left(LostBot(lostBot)) => {
        for {
          _ <- State.modify[Planet](planet => Planet.addMarker(planet, lostBot.xPos, lostBot.yPos))
        } yield result
      }
      case Right(bot) => State.pure(result)
    }
  }

}

