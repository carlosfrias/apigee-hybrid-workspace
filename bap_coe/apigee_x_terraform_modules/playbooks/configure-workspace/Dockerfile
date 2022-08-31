FROM python:3.10.2
RUN git clone https://github.com/carlosfrias/apigee-hybrid-workspace.git
RUN ./apigee-hybrid-workspace/bap_coe/apigee_x_terraform_modules/playbooks/configure-workspace/prepare-systems.sh
RUN  apt update -y \
     && apt dist-upgrade -y \
     && apt install software-properties-common curl git mc vim facter aptitude -y \

RUN curl https://pyenv.run | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc


RUN pyenv install 3.10.2
RUN pyenv virtualenv 3.10.2 apigee

RUN pyenv activate apigee \
    && pip install pip -U \
    && pip install -r ./requirements.txt


ENTRYPOINT ["/bash"]


