#!/bin/bash -uxe

install_pyenv() {
  curl https://pyenv.run | bash

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
  exec $SHELL
}

prepare_dev() {
    $SUDO apt update -y
    $SUDO apt dist-upgrade -y
    $SUDO apt install software-properties-common curl git mc vim facter aptitude -y
    [ $(uname -m) == "aarch64" ] && $SUDO apt install gcc libffi-dev libssl-dev make -y

    PYTHON_BIN=/usr/bin/python
    install_pyenv
#    $SUDO pip install python3-apt -U
}

prepare_dev
install_pyenv
