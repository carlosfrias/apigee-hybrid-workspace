#!/bin/bash
export DEBIAN_FRONTEND="noninteractive apt-get install -y --no-install-recommends tzdata"
apt update -y
apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
software-properties-common git
apt update -y
