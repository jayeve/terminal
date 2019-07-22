from jayeve/vimbox:latest

env CONTAINER_NAME rustbox

run groupadd -o -g 1000 dev && \
    useradd -o -r -m -u 1000 -g 1000 dev && \
    chown -R dev: /home/dev && \
    chown -R dev: /etc/bash_completion.d

# add dev user as a sudo user
# TODO move to vimbox because it's a base image type of thing FIXME
run apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
    usermod -aG sudo dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# install docker deps
run apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# install docker and docker-compose
run curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

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
