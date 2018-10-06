#!/bin/sh
project_name=scalabox
mkdir -p $project_name/src/main/resources $project_name/src/main/scala
mkdir -p $project_name/lib $project_name/project $project_name/target

# create an initial build.sbt file
echo 'name := "ScalaBox"
version := "1.0"
scalaVersion := "2.11.8"
libraryDependencies += "com.github.pureconfig" %% "pureconfig" % "0.9.0"' > build.sbt
