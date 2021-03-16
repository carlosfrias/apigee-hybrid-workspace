#!/bin/bash
export DEBIAN_FRONTEND="noninteractive apt install -y --no-install-recommends tzdata"
apt update -y
apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
software-properties-common
add-apt-repositor -y ppa:deadsnakes/ppa
apt update -y
#apt install python3
curl https://pyenv.run | bash
export PATH=~/.pyenv/bin:$PATH
echo "PATH=~/.pyenv/bin:$PATH" >> ~/.bashrc
echo "eval '$(pyenv init -)'" >> ~/.bashrc
echo "eval '$(pyenv virtualenv-init -)'" >> ~/.bashrc
source ~/.bashrc
pyenv install 3.9.1
#exec "$SHELL"
#pyenv virtualenv 3.9.1 ups_perf_test
#pyenv activate ups_perf_test
#pip3 install -r requirements.txt
#ansible-galaxy install -r collections.yml
#ansible-playbook create.yml
