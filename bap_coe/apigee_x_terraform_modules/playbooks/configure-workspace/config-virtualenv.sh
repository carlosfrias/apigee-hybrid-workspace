#!/bin/bash -uxe
source ~/.bashrc
pyenv install 3.10.2
pyenv virtualenv 3.10.2 apigee
pyenv activate apigee
pip install pip -U
pip install -r ./requirements.txt