#!/bin/bash -l

cd /bootstrap-runtime
pyenv activate apigee
pip install -r resources/docker-helper-requirements.txt
