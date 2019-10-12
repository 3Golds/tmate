#!/bin/bash
set -eux
VERSION=$1
PLATFORM=$2
RELEASE_NAME=tmate-$VERSION-static-linux-$PLATFORM

# Run this before:
# docker build . --tag local-$PLATFORM/tmate-build --build-arg PLATFORM=$PLATFORM

mkdir -p /tmp/tmate-release/$RELEASE_NAME
cd /tmp/tmate-release
docker run --rm local-$PLATFORM/tmate-build cat tmate > $RELEASE_NAME/tmate
tar -cf - $RELEASE_NAME | xz > tmate-$VERSION-static-linux-$PLATFORM.tar.xz
