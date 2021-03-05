#!/bin/bash
apt update -y
apt install -y git python3-pip
pip3 install -r requirements.txt
ansible-galaxy collection install collections.yml
ansible-playbook create.yml
