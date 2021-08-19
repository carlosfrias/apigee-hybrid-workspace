FROM ubuntu:16.04
RUN apt update -y \
    && apt-get install -y git make build-essential libssl-dev zlib1g-dev sudo \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl vim tree \
    && curl https://pyenv.run | bash
RUN echo "WARNING: seems you still have not added 'pyenv' to the load path." >> /root/.bashrc \
    && echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> /root/.bashrc\
    && echo 'eval "$(pyenv init -)"' >> /root/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

ENTRYPOINT bash
