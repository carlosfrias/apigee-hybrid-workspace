#!/bin/bash -l

cd /bootstrap-runtime
pyenv activate apigeex
pip install -r docker-helper/docker-helper-requirements.txt
