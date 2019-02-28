from ubuntu:18.10 # Ubuntu cosmic

run apt-get update && apt-get install -yq git \
    subversion \
    sudo \
    python \
    curl \
    vim \
    diffstat \
    pkg-config \
    cmake \
    bash-completion \
    build-essential \
    python3-pip \
    tcpdump \
    tmux \
    dnsutils \
    net-tools \
    ripgrep && \
    mkdir -p /home/dev

workdir /home/dev
env HOME /home/dev
env CONTAINER_NAME vimbox

# setup vim
# configure bash and vim
run svn checkout https://github.com/jayeve/terminal/trunk/dotfiles && \
    cp $HOME/dotfiles/bash/.bash_aliases $HOME && \
    cp $HOME/dotfiles/bash/.bash_utils $HOME && \
    cp $HOME/dotfiles/bash/.docker_profile $HOME/.bash_profile && \
    cp $HOME/dotfiles/tmux/.tmux* $HOME && \
    rm -r dotfiles && \
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
    bash $HOME/.fzf/install && \
    pip3 install sexpdata websocket-client neovim && \
    svn checkout https://github.com/jayeve/terminal/trunk/dotfiles/vim && \
    cd $HOME/vim && \
    ./install.sh && \
    cd $HOME && \
    rm -rf $HOME/vim

entrypoint ["/bin/bash", "-l"]
