# Doesn't work when included in the build file and executed with RUN
# Works when the RUN executes this script

cd
source $HOME/.bashrc
pyenv update
pyenv install 3.13.3
pyenv global 3.13.3
pip install --upgrade pip
pyenv virtualenv 3.13.3 apigee-workspace
pyenv activate apigee-workspace
