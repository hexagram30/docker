#!/bin/sh

SCALA_VERS=2.12
KAFKA_VERS=1.0.1
SCALA_KAFKA_VERS=${SCALA_VERS}-${KAFKA_VERS}
INSTALL_OPTS="-y --no-install-recommends"
PACKAGES="curl zookeeper supervisor dnsutils"
