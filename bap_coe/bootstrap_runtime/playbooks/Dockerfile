#
# Usage instructions
# Building this Dockerfile
# docker built -t apigee-build .&& docker run -ti apigee-build:latest bash
#
FROM python:3.10.2 AS basic_bootstrap

RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg -y

#RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add -
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | tee /usr/share/keyrings/cloud.google.gpg > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get update -y
RUN apt-get install google-cloud-cli -y

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

VOLUME /bootstrap-runtime
WORKDIR /bootstrap-runtime

COPY molecule /bootstrap-runtime/molecule
COPY molecule /bootstrap-runtime/resources
RUN bash -l /bootstrap-runtime/resources/docker-helper-config-pyenv.sh
ENTRYPOINT bash
