#!/bin/bash

echo "Setup apigee-workspace"

curl https://pyenv.run | bash
export PATH=~/.pyenv/bin:$PATH
echo 'export PATH=\"~/.pyenv/bin:$PATH\"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.9.1
pyenv virtualenv 3.9.1 bap_coe
pyenv activate bap_coe
pip3 install ansible
