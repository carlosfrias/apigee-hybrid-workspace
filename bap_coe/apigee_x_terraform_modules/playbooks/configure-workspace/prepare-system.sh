#!/bin/bash -uxe

install_pyenv() {
  curl https://pyenv.run | bash

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  pyenv install 3.10.2
  pyenv virtualenv 3.10.2 apigee
  pyenv activate apigee

  $SUDO pip install setuptools -U
  $SUDO pip install ansible -U
  $SUDO pip install netaddr -U
  $SUDO pip install dnspython -U
  $SUDO pip install passlib -U
  $SUDO pip install bcrypt -U
}

install_pip() {
  curl https://bootstrap.pypa.io/get-pip.py | $SUDO $PYTHON_BIN
  $SUDO pip install setuptools -U
  $SUDO pip install ansible -U
  $SUDO pip install netaddr -U
  $SUDO pip install dnspython -U
  $SUDO pip install passlib -U
  $SUDO pip install bcrypt -U
}

prepare_dev() {
    $SUDO apt update -y
    $SUDO apt dist-upgrade -y
    $SUDO apt install software-properties-common curl git mc vim facter aptitude -y
#    [ $(uname -m) == "aarch64" ] && $SUDO apt install gcc libffi-dev libssl-dev make -y

    PYTHON_BIN=/usr/bin/python
    install_pyenv
#    $SUDO pip install python3-apt -U

}

prepare_ubuntu() {
  $SUDO apt update -y
  $SUDO apt dist-upgrade -y
  $SUDO apt install software-properties-common curl git mc vim facter python python-is-python3 python-apt aptitude -y
  [ $(uname -m) == "aarch64" ] && $SUDO apt install gcc python-dev libffi-dev libssl-dev make -y

  PYTHON_BIN=/usr/bin/python
  install_pip
  $SUDO pip install python-apt -U

  ansible --version
}

prepare_debian() {
  $SUDO apt update -y
  $SUDO apt dist-upgrade -y
  $SUDO apt install dirmngr curl git mc vim facter python python-apt aptitude -y
  [ $(uname -m) == "aarch64" ] && $SUDO apt install gcc python-dev libffi-dev libssl-dev make -y

  PYTHON_BIN=/usr/bin/python
  install_pip
  $SUDO pip install python-apt -U

  ansible --version
}

prepare_raspbian() {
  $SUDO apt update -y
  $SUDO apt dist-upgrade -y
  $SUDO apt install dirmngr mc vim git libffi-dev curl facter -y
  PYTHON_BIN=/usr/bin/python
  install_pip

  ansible --version
}

prepare_centos() {
  $SUDO yum install epel-release -y
  $SUDO yum install git vim mc curl facter libselinux-python python -y
  $SUDO yum update -y

  PYTHON_BIN=/usr/bin/python
  install_pip

  ansible --version
}

prepare_fedora() {
  $SUDO dnf install git vim mc curl facter libselinux-python python python3 python3-dnf -y
  $SUDO dnf update -y

  PYTHON_BIN=/usr/bin/python
  install_pip
  $SUDO dnf reinstall python3-pip -y

  ansible --version
}

prepare_amzn() {
  $SUDO amazon-linux-extras install epel -y
  $SUDO yum install git vim mc curl facter libselinux-python python -y
  $SUDO yum update -y

  PYTHON_BIN=/usr/bin/python
  install_pip

  ansible --version
}

usage() {
  echo
  echo "Linux distribution not detected."
  echo "Use: ID=[ubuntu|debian|centos|raspbian|amzn|fedora|dev] prepare_system.sh"
  echo "Other distributions not yet supported."
  echo
}

if [ -f /etc/os-release ]; then
  . /etc/os-release
elif [ -f /etc/debian_version ]; then
  $ID=debian
fi

# root or not
if [[ $EUID -ne 0 ]]; then
  SUDO='sudo -H'
else
  SUDO=''
fi

prepare_dev

case $ID in
#'ubuntu')
#  prepare_ubuntu
#  ;;
#'debian')
#  prepare_debian
#  ;;
#'raspbian')
#  prepare_raspbian
#  ;;
#'centos')
#  prepare_centos
#  ;;
#'fedora')
#  prepare_fedora
#  ;;
#'amzn')
#  prepare_amzn
#  ;;
'dev')
  prepare_dev
  ;;

*)
  usage
  ;;
esac
