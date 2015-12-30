#!/bin/sh
cd ..
if [ ! -f nd4j ]; then
    git clone https://github.com/deeplearning4j/nd4j.git
fi

if [ ! -f Canova ]; then
    git clone https://github.com/deeplearning4j/Canova.git
fi
cd nd4j
git pull
mvn clean install -DskipTests -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Dsource.skip=true -DskipITs=true -X -T 1C
cd ..
cd Canova
git pull
mvn clean install -DskipTests -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Dsource.skip=true -DskipITs=true -X -T 1C
cd ..
cd deeplearning4j
mvn clean install -DskipTests -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Dsource.skip=true -DskipITs=true -X -T 1C
