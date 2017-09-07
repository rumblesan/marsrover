package com.rumblesan.marsrover.test

import org.specs2.mutable._

import com.rumblesan.marsrover.Planet


class PlanetSpec extends Specification {

  "Mars Rover Planet" should {

    "find valid positions" in {
      val planet = Planet(1, 1, Set.empty)

      Planet.validPosition(planet, 1, 1) must beTrue
    }

    "find invalid positions" in {
      val planet = Planet(1, 1, Set.empty)

      Planet.validPosition(planet, 1, 2) must beFalse
    }

    "can add markers" in {
      val planet = Planet(1, 1, Set.empty)
      val expected = Planet(1, 1, Set((1, 1)))

      Planet.addMarker(planet, 1, 1) mustEqual expected
    }

    "can check valid markers" in {
      val planet = Planet(1, 1, Set((1, 1)))

      Planet.checkMarker(planet, 1, 1) must beTrue
    }

    "won't find invalid markers" in {
      val planet = Planet(1, 1, Set((1, 1)))

      Planet.checkMarker(planet, 0, 1) must beFalse
    }

  }

}

