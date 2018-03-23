#!/bin/sh

. /build/common.sh

HTTP_ENDPOINT=http://apache.mirrors.spacedump.net/kafka

curl \
$HTTP_ENDPOINT/$KAFKA_VERS/kafka_$SCALA_KAFKA_VERS.tgz \
-o /tmp/kafka_$SCALA_KAFKA_VERS.tgz

tar xfz /tmp/kafka_$SCALA_KAFKA_VERS.tgz -C /opt && \

rm /tmp/kafka_$SCALA_KAFKA_VERS.tgz
