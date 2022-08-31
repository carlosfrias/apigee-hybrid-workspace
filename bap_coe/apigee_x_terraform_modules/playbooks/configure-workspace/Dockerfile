FROM python:3.10.2
WORKDIR /usr/local/src
RUN git clone https://github.com/carlosfrias/apigee-hybrid-workspace.git
WORKDIR /usr/local/src/apigee-hybrid-workspace
RUN git checkout master \
    && git pull 

RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude -y

RUN curl https://pyenv.run | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> /root/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

RUN bash /root/.bashrc
RUN /root/.pyenv/bin/pyenv install 3.10.2
RUN /root/.pyenv/bin/pyenv global 3.10.2
RUN /root/.pyenv/bin/pyenv virtualenv 3.10.2 apigee
RUN bash /root/.bashrc
RUN $(which pip) install pip -U
WORKDIR /usr/local/src/apigee-hybrid-workspace/bap_coe/apigee_x_terraform_modules/playbooks
RUN $(which pip) install -r ./configure-workspace/requirements.txt
RUN cp molecule/shared/attributes.yml.template attributes.yml \
    && mkdir -p /root/.apigee-secure \
    && touch /root/.apigee-secure/apigee-hybrid-sensitive-attributes.yml \
    && echo 'GCLOUD_ACCOUNT_USER: "CHANGE_ME"' >> /root/.apigee-secure/apigee-hybrid-sensitive-attributes.yml \
    && echo 'GCLOUD_ACCOUNT_DOMAIN: "CHANGE_ME"' >> /root/.apigee-secure/apigee-hybrid-sensitive-attributes.yml \
    && echo 'BILLING_ID: "CHANGE_ME"' >> /root/.apigee-secure/apigee-hybrid-sensitive-attributes.yml \
    && echo 'GCLOUD_ORG_ID: "CHANGE_ME"' >> /root/.apigee-secure/apigee-hybrid-sensitive-attributes.yml
CMD /root/.pyenv/bin/pyenv activate apigee

