# Mars Rover

A haskell implementation of a Mars rover simulation.

Built locally using the stack build tool, also has a dockerfile to run things in.

The program is structured as a library which contains the logic and then an executable which has the (very) basic user interface.

## Stack build

Stack can be installed with homebrew on OSX.

```
stack build
stack test
stack exec marsrover-exe
```

## Docker build

A bit more involved, but maybe easier to use for some.

Image can be built locally, but is also available on dockerhub.
```
docker build -t rumblesan/marsrover .
```

```
docker run --rm rumblesan/marsrover stack test
docker run --rm -it rumblesan/marsrover stack exec marsrover-exe
```
