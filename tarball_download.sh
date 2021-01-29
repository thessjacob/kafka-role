#!/bin/bash
# This script will pull down current jdk and kafka tarballs
JDK=$(find files/ -name 'jdk*.tgz')
KAFKA=$(find files/ -name 'kafka*.tgz')

if [[ ! -f $JDK ]]; then
  wget --no-check-certificate https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz
  mv openjdk-15.0.2_linux-x64_bin.tar.gz files/jdk-15.0.2.tgz
fi

if [[ ! -f $KAFKA ]]; then
  wget --no-check-certificate https://mirrors.gigenet.com/apache/kafka/2.7.0/kafka_2.13-2.7.0.tgz
  mv kafka_2.13-2.7.0.tgz files/kafka_2.13-2.7.0.tgz
fi
