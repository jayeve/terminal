from jayeve/vimbox:latest

env CONTAINER_NAME rustbox

run apt-get update && apt-get install -y --no-install-recommends sudo

# add dev user ass a sudo user
run groupadd -o -g 1000 dev && \
    useradd -o -r -m -u 1000 -g 1000 dev && \
    chown -R dev: /home/dev && \
    chown -R dev: /etc/bash_completion.d && \
    groupadd docker
# To allow us to access /var/run/docker.sock on the Mac
run gpasswd -a dev staff && \
    usermod -aG sudo dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

env USER dev
env SHELL /bin/bash
workdir /home/dev

user dev

# install rust with rustup and rustup bash completions
run curl https://sh.rustup.rs -sSf | sh -s -- -y
# FIXME rustup on source
#rustup completions bash > /etc/bash_completion.d/rustup.bash-completion >> ~/.bashrc

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile sources
# the bashrc
entrypoint ["/bin/bash", "-l"]
