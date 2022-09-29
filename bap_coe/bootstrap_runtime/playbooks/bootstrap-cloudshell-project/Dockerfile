#
# Usage instructions
# Building this Dockerfile
# docker built -t apigee-build .&& docker run -ti apigee-build:latest bash
FROM gcr.io/cloudshell-images/cloudshell:latest as basic_bootstrap
#FROM python:3.10.2 AS basic_bootstrap
RUN sudo apt-get update -y \
    && sudo apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg -y

FROM basic_bootstrap AS pyenv
RUN curl https://pyenv.run | bash \
    && echo '' >> /root/.bashrc \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> /root/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc \
    && bash /root/.bashrc \
    && /root/.pyenv/bin/pyenv install 3.10.2 \
    && /root/.pyenv/bin/pyenv global 3.10.2 \
    && /root/.pyenv/bin/pyenv virtualenv 3.10.2 apigee \
    && bash /root/.bashrc



FROM pyenv
VOLUME /bootstrap-runtime
WORKDIR /bootstrap-runtime
COPY molecule /bootstrap-runtime/molecule/
COPY docker-helper /bootstrap-runtime/docker-helper/
COPY resources /bootstrap-runtime/resources/
RUN bash -l /bootstrap-runtime/docker-helper/docker-helper-config-pyenv.sh \
    && mkdir -p work_dir \
    && chmod -R +w work_dir
ENTRYPOINT bash
