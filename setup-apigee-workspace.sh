#!/bin/bash

echo "Setup apigee-workspace"

export PATH=$HOME/.pyenv/bin:$PATH
curl -s https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.9.1
source ~/.bashrc
pyenv virtualenv 3.9.1 bap_coe
source ~/.bashrc
pyenv activate bap_coe
source ~/.bashrc
pip install pip -U
pip install ansible -U
