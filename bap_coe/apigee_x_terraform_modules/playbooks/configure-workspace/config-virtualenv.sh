#!/bin/bash -uxe
pyenv install 3.10.2
pyenv virtualenv 3.10.2 apigee
pyenv activate apigee


# root or not
if [[ $EUID -ne 0 ]]; then
  SUDO='sudo -H'
else
  SUDO=''
fi

$SUDO pip install setuptools -U
$SUDO pip install ansible -U
$SUDO pip install netaddr -U
$SUDO pip install dnspython -U
$SUDO pip install passlib -U
$SUDO pip install bcrypt -U
