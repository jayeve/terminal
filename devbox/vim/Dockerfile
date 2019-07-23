from ubuntu:19.10

env SHELL /bin/bash
env CONTAINER_NAME vimbox
# to avoid prompts for apt-get update
env DEBIAN_FRONTEND=noninteractive
run apt-get update && apt-get install -yq \
    git \
    subversion \
    sudo \
    python \
    curl \
    diffstat \
    pkg-config \
    cmake \
    bash-completion \
    build-essential \
    python3-pip \
    tcpdump \
    vim-gtk \
    tmux \
    dnsutils \
    net-tools \
    ripgrep

# create /home/dev as working dir with vim/bash setup
run mkdir -p /home/dev
workdir /home/dev
env HOME /home/dev
run svn checkout https://github.com/jayeve/terminal/trunk/dotfiles && \
    cp $HOME/dotfiles/bash/.bash_aliases $HOME && \
    cp $HOME/dotfiles/bash/.bash_utils $HOME && \
    cp $HOME/dotfiles/bash/.docker_profile $HOME/.bash_profile && \
    cp $HOME/dotfiles/tmux/.tmux* $HOME && \
    rm -r dotfiles && \
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
    bash $HOME/.fzf/install && \
    pip3 install pynvim sexpdata websocket-client neovim && \
    svn checkout https://github.com/jayeve/terminal/trunk/dotfiles/vim && \
    cd $HOME/vim && \
    ./install.sh && \
    cd $HOME && \
    rm -rf $HOME/vim

# install docker deps, docker, and docker-compose
run apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# setup dev user and add dev as a sudo user (no passwrod)
run groupadd -o -g 1000 dev && \
    useradd -o -r -m -u 1000 -g 1000 dev && \
    chown -R dev: /home/dev && \
    chown -R dev: /etc/bash_completion.d && \
    apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
    usermod -aG sudo dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

entrypoint ["/bin/bash", "-l"]
