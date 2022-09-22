#!/bin/bash -l

cd /bootstrap-runtime
pyenv activate apigee
pip install -r docker-helper/docker-helper-requirements.txt
