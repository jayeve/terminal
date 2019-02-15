from jayeve/vimbox:latest

env CONTAINER_NAME rustbox
# TODO bash completions
run adduser --disabled-password --gecos '' dev && chown -R dev: /home/dev
user dev
env USER dev
ENV SHELL /bin/bash
WORKDIR /home/dev

run curl https://sh.rustup.rs -sSf | sh -s -- -y

# rust specific rc configs
run echo "[ -f ~/.profile ] && source ~/.profile" >> ~/.bashrc
run echo "rustup completions bash > /etc/bash_completion.d/rustup.bash-completion" >> ~/.bashrc

entrypoint ["/bin/bash", "-i"]
