name := "Mars Rover"

organization := "com.rumblesan"

version := "0.1.0"

scalaVersion := "2.12.1"

libraryDependencies ++= Seq(
  "org.specs2" %% "specs2-core" % "3.9.5" % "test",
  "org.typelevel" %% "cats-core" % "1.0.0-MF"
)

scalacOptions ++= Seq("-unchecked", "-deprecation", "-language:_")

resolvers ++= Seq("snapshots" at "http://oss.sonatype.org/content/repositories/snapshots",
                  "releases"  at "http://oss.sonatype.org/content/repositories/releases")
