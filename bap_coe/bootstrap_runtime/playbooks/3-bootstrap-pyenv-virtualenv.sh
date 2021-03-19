#!/bin/bash
pyenv virtualenv 3.9.1 bap_coe
pyenv activate bap_coe
pip3 install -r requirements.txt
ansible-galaxy install -r collections.yml --force
