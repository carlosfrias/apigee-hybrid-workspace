# Usage instructions
# Building this Dockerfile
# docker built -t bootstrap . && docker run -ti bootstrap:latest bash

FROM python:3.11.2 AS basic_bootstrap

RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg -y \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | tee /usr/share/keyrings/cloud.google.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update -y \
    && apt-get install google-cloud-cli -y


FROM basic_bootstrap

VOLUME /bootstrap-runtime

WORKDIR /bootstrap-runtime

COPY molecule/ /bootstrap-runtime/molecule/
COPY resources/ /bootstrap-runtime/resources/
COPY bootstrap/ /bootstrap-runtime/resources/

RUN pip3 install pip --upgrade \
    && pip3 install -r /bootstrap-runtime/resources/requirements.txt \

RUN mkdir -p work_dir \
    && chmod -R +w work_dir \
    && mkdir -p ~/.apigee-secure \
    && cp resources/credentials.yml.template ~/.apigee-secure/credentials.yml

ENTRYPOINT bash
