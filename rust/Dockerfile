from jayeve/vimbox:latest

env CONTAINER_NAME rustbox
# TODO bash completions
run adduser --disabled-password --gecos '' dev && chown -R dev: /home/dev
user dev
env USER dev
ENV SHELL /bin/bash
WORKDIR /home/dev

run curl https://sh.rustup.rs -sSf | sh -s -- -y

entrypoint ["/bin/bash", "-i"]
