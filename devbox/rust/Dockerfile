from jayeve/vimbox:latest

env CONTAINER_NAME rustbox

run apt-get install libssl-dev

env USER dev
workdir /home/dev

user dev

# install rust with rustup and rustup bash completions
run curl https://sh.rustup.rs -sSf | bash -s -- -y
shell ["/bin/bash", "-c", "source $HOME/.cargo/env"]
run rustup component add rustfmt --toolchain stable-x86_64-unknown-linux-gnu && \
run rustup completions bash > /etc/bash_completion.d/rustup.bash-completion >> ~/.bashrc

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile sources
# the bashrc
entrypoint ["/bin/bash", "-l"]
