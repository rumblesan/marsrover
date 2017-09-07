package com.rumblesan.marsrover.test

import org.specs2.mutable._

import com.rumblesan.marsrover.Bot
import com.rumblesan.marsrover.Headings.{North, South, East, West}
import com.rumblesan.marsrover.Commands.{TurnLeft, MoveForward, TurnRight}


class BotSpec extends Specification {

  "Mars Rover Bot" should {

    "turn left" in {
      val bot = Bot(1, 1, North)
      val expected = Bot(1, 1, West)

      Bot.turnLeft(bot) mustEqual expected
    }

    "turn right" in {
      val bot = Bot(1, 1, North)
      val expected = Bot(1, 1, East)

      Bot.turnRight(bot) mustEqual expected
    }

    "advance" in {
      val bot = Bot(1, 1, North)
      val expected = Bot(1, 2, North)

      Bot.moveForward(bot) mustEqual expected
    }

  }

}

