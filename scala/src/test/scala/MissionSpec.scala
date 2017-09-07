package com.rumblesan.marsrover.test

import org.specs2.mutable._

import com.rumblesan.marsrover.Mission
import com.rumblesan.marsrover.Bot
import com.rumblesan.marsrover.Planet
import com.rumblesan.marsrover.Headings.{North, South, East, West}
import com.rumblesan.marsrover.Commands.{TurnLeft, MoveForward, TurnRight}


class MissionSpec extends Specification {

  "Mars Rover Mission" should {

    "succeed when expected" in {
      val mission = Mission(1, 1, North, List(TurnRight, MoveForward))
      val planet = Planet(5, 5, Set.empty)
      val expected = Right(Bot(2, 1, East))
      Mission.run(mission, planet) mustEqual expected
    }

    "fail when expected" in {
      val mission = Mission(3, 3, North, List(MoveForward, MoveForward, MoveForward, MoveForward, MoveForward))
      val planet = Planet(5, 5, Set.empty)
      val expected = Left(Mission.LostBot(Bot(3, 5, North)))
      Mission.run(mission, planet) mustEqual expected
    }

  }

}

