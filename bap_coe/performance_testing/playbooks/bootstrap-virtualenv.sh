#!/bin/bash
pyenv virtualenv 3.9.1 ups_perf_test
pyenv activate ups_perf_test
pip3 install -r requirements.txt
ansible-galaxy install -r collections.yml
ansible-playbook create.yml
