from jayeve/vimbox:latest

env CONTAINER_NAME rustbox

# add dev user
run adduser --disabled-password --gecos '' dev && chown -R dev: /home/dev
env USER dev

env SHELL /bin/bash
workdir /home/dev

run su dev -c "curl https://sh.rustup.rs -sSf | sh -s -- -y"

# rustup bash completions
run echo "rustup completions bash > /etc/bash_completion.d/rustup.bash-completion" >> ~/.bashrc
user dev

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile source
# the bashrc
entrypoint ["/bin/bash", "-l"]
