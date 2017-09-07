package com.rumblesan.marsrover

case class Planet(width: Int, height: Int, markers: Set[(Int, Int)])

object Planet {

  def validPosition(planet: Planet, xPos: Int, yPos: Int): Boolean = {
    (xPos >= 0 && xPos <= planet.width && yPos >= 0 && yPos <= planet.height)
  }

  def addMarker(planet: Planet, xPos: Int, yPos: Int): Planet = {
    planet.copy(markers = planet.markers + ((xPos, yPos)))
  }

  def checkMarker(planet: Planet, xPos: Int, yPos: Int): Boolean = {
    planet.markers.contains((xPos, yPos))
  }

}


