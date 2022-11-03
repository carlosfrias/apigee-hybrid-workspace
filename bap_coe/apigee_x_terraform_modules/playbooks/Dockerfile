#
# Usage instructions
# Building this Dockerfile
# docker built -t apigee-build .&& docker run -ti apigee-build:latest bash
#
FROM python:3.10.2 as python_core
RUN apt-get update -y \
    && apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg tree -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update -y \
    && apt-get install google-cloud-sdk -y


FROM python_core
VOLUME /bootstrap-runtime
WORKDIR /bootstrap-runtime
COPY molecule /bootstrap-runtime/molecule/
COPY docker-helper /bootstrap-runtime/docker-helper/
COPY resources /bootstrap-runtime/resources/
RUN mkdir -p ~/.apigee-secure \
    && cp /bootstrap-runtime/resources/credentials.yml.template ~/.apigee-secure/credentials.yml
RUN mkdir -p work_dir \
    && chmod -R +w work_dir\
    && pip install -r docker-helper/docker-helper-requirements.txt

ENTRYPOINT bash

