#!/bin/sh

. /build/common.sh

apt-get update
apt-get install $INSTALL_OPTS $PACKAGES

