FROM haskell:8.0

MAINTAINER Guy John <guy@rumblesan.com>

RUN mkdir /opt/marsrover
WORKDIR /opt/marsrover

COPY LICENSE LICENSE
COPY README.md README.md

COPY marsrover.cabal marsrover.cabal
COPY stack.yaml stack.yaml

RUN stack update

COPY app app
COPY test test
COPY src src

RUN stack test
RUN stack build

CMD ["true"]
