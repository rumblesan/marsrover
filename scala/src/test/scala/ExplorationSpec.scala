package com.rumblesan.marsrover.test

import cats._
import cats.data._

import org.specs2.mutable._

import com.rumblesan.marsrover.Explore
import com.rumblesan.marsrover.Mission
import com.rumblesan.marsrover.Bot
import com.rumblesan.marsrover.Planet
import com.rumblesan.marsrover.Headings.{North, South, East, West}
import com.rumblesan.marsrover.Commands.{TurnLeft, MoveForward, TurnRight}


class ExplorationSpec extends Specification {

  "Mars Rover Explorations" should {

    "run multiple missions when expected" in {
      val missions = List(
        Mission(1, 1, North, List(TurnRight, MoveForward)),
        Mission(4, 4, South, List(MoveForward, MoveForward))
      )
      val planet = Planet(5, 5, Set.empty)
      val expected = List(
        Right(Bot(2, 1, East)),
        Right(Bot(4, 2, South))
      )
      Explore.run(planet, missions) mustEqual expected
    }

    "run the test cases" in {
      val missions = List(
        Mission(1, 1, East, List(
          TurnRight, MoveForward, TurnRight, MoveForward,
          TurnRight, MoveForward, TurnRight, MoveForward
        )),
        Mission(3, 2, North, List(
          MoveForward, TurnRight, TurnRight, MoveForward,
          TurnLeft, TurnLeft, MoveForward, MoveForward,
          TurnRight, TurnRight, MoveForward, TurnLeft, TurnLeft
        )),
        Mission(0, 3, West, List(
          TurnLeft, TurnLeft, MoveForward, MoveForward, MoveForward,
          TurnLeft, MoveForward, TurnLeft, MoveForward, TurnLeft
        ))
      )
      val planet = Planet(5, 3, Set.empty)
      val expected = List(
        Right(Bot(1, 1, East)),
        Left(Mission.LostBot(Bot(3, 3, North))),
        Right(Bot(2, 3, South))
      )

      Explore.run(planet, missions) mustEqual expected
    }
  }

}

