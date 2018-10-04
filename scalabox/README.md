# Scalabox

A minimal dockerized dev environment, build for x86_64 architecture

Contains

- jdk8
- scala
- sbt
- assorted shell network commands handy for live debugging/triaging

## Build & Run

Your first build may take a minute

```
docker build -t jayeve/scalabox .
docker run -it jayeve/scalabox
```

![Scalabox GIF](https://github.com/jayeve/terminal/raw/master/scalabox/demo2.gif)
