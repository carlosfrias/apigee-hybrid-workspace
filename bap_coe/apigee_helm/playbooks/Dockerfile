# Usage instructions
# Building this Dockerfile
# docker built -t bootstrap . && docker run -ti bootstrap:latest bash

FROM python:3.11.4 AS basic_bootstrap

RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg python3-pip libssl-dev libffi-dev -y \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | tee /usr/share/keyrings/cloud.google.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update -y \
    && apt-get install google-cloud-cli -y \
    && pip install --upgrade pip

FROM basic_bootstrap

WORKDIR /installer

COPY molecule/ /installer/molecule/
COPY resources/ /installer/resources/
COPY bootstrap/ /installer/resources/

RUN pip install -r /installer/resources/requirements.txt \
    && mkdir -p work_dir \
    && chmod -R +w work_dir \
    && mkdir -p ~/.apigee-secure \
    && cp resources/credentials.yml.template ~/.apigee-secure/credentials.yml

ENTRYPOINT bash
