# Usage instructions
# Building this Dockerfile
# docker built -t bootstrap . && docker run -ti bootstrap:latest bash

#FROM python:3.11.2 AS basic_bootstrap
#RUN apt-get update -y \
#    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg python3-pip libssl-dev libffi-dev -y \
#    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | tee /usr/share/keyrings/cloud.google.gpg > /dev/null \
#    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
#    && apt-get update -y \
#    && apt-get install google-cloud-cli -y \
#    && curl -fsSL https://pyenv.run | bash \
#    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc \
#    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.profile \
#    && echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
#    && echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile \
#    && echo "eval '$(pyenv init - bash)'" >> /root/.bashrc \
#    && echo "eval '$(pyenv init - bash)'" >> /root/.profile \
#    && echo "eval '$(pyenv virtualenv-init -)'" >> /root/.bashrc \
#    && echo "eval '$(pyenv virtualenv-init -)'" >> /root/.profile \
#    && exec bash \
#    && HOME=/root/.bashrc \
#    && pyenv update \
#    && pyenv install 3.11.2 \
#    && pyenv global 3.11.2 \
#    && pip install --upgrade pip

#FROM basic_bootstrap
#RUN mkdir -p /installer
#WORKDIR /installer
#COPY molecule /installer/molecule/
#COPY resources /installer/resources/
#COPY utils /installer/utils/
#COPY work_dir/bap_coe-site-packages-molecule /installer/resources/versions/3.11.2/envs/bap_coe/lib/python3.11/site-packages/
#RUN pip install -r /installer/resources/requirements.txt
#RUN mkdir -p work_dir \
#  && chmod -R +w work_dir \
#  && mkdir -p ~/.apigee-secure \
#  && cp resources/credentials.yml.template ~/.apigee-secure/credentials.yml
#ENTRYPOINT bash

#FROM basic_bootstrap AS project_bootstrap
#RUN mkdir -p /apigee-workspace/apigee-helm
#WORKDIR /apigee-workspace/apigee-helm
#RUN mkdir -p work_dir \
#  && chmod -R +w work_dir \
#  && mkdir -p ~/.apigee-secure \
#  && cp resources/credentials.yml.template ~/.apigee-secure/credentials.yml
#COPY molecule /apigee-workspace/apigee-helm/molecule/
#COPY resources /apigee-workspace/apigee-helm/resources/
#COPY utils /apigee-workspace/apigee-helm/utils/
#COPY work_dir/bap_coe-site-packages-molecule /apigee-workspace/apigee-helm/resources/versions/3.11.2/envs/bap_coe/lib/python3.11/site-packages/
#RUN pip install -r /apigee-workspace/apigee-helm/resources/requirements.txt
#ENTRYPOINT bash

FROM python:3.11.2 AS basic_bootstrap
RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg python3-pip libssl-dev libffi-dev -y

RUN curl -O --output-dir /tmp https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz \
    && tar -xf /tmp/google-cloud-cli-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh -q \
    && echo 'export PATH="/google-cloud-sdk/bin:$PATH"' >> $HOME/.bashrc \
    && echo 'export PATH="/google-cloud-sdk/bin:$PATH"' >> $HOME/.profile \

RUN gcloud components install kubectl -q

RUN curl -fsSL https://pyenv.run | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.profile \
    && echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile \
    && echo 'eval "$(pyenv init - bash)"' >> $HOME/.bashrc \
    && echo 'eval "$(pyenv init - bash)"' >> $HOME/.profile \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.profile

RUN mkdir -p /apigee-workspace/apigee-helm/bootstrap
WORKDIR /apigee-workspace/apigee-helm
COPY utils/configure-pyenv.sh /apigee-workspace/apigee-helm/bootstrap/
RUN bash /apigee-workspace/apigee-helm/bootstrap/configure-pyenv.sh

FROM basic_bootstrap

COPY molecule /apigee-workspace/apigee-helm/molecule/
COPY resources /apigee-workspace/apigee-helm/resources/
COPY utils /apigee-workspace/apigee-helm/utils/
COPY work_dir/bap_coe-site-packages-molecule /apigee-workspace/apigee-helm/resources/versions/3.11.2/envs/bap_coe/lib/python3.11/site-packages/

RUN pip install -r /apigee-workspace/apigee-helm/resources/requirements.txt
RUN mkdir -p work_dir \
  && chmod -R +w work_dir \
  && mkdir -p ~/.apigee-secure \
  && cp resources/credentials.yml.template ~/.apigee-secure/credentials.yml

ENTRYPOINT bash
