from ubuntu:19.10

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
    pip3 install pynvim sexpdata websocket-client neovim && \
    svn checkout https://github.com/jayeve/terminal/trunk/dotfiles/vim && \
    cd $HOME/vim && \
    ./install.sh && \
    cd $HOME && \
    rm -rf $HOME/vim

entrypoint ["/bin/bash", "-l"]
