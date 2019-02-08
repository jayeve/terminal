from ubuntu

run apt-get update && apt-get install -yq git \
    subversion \
    sudo \
    python \
    curl \
    vim \
    diffstat \
    pkg-config \
    cmake \
    build-essential \
    python3-pip \
    tcpdump \
    tmux \
    dnsutils \
    net-tools \
    silversearcher-ag \
    scala \
    && useradd dev \
    && mkdir /home/dev && chown -R dev: /home/dev \
    && mkdir /var/shared/ \
    && touch /var/shared/placeholder \
    && chown -R dev:dev /var/shared

volume /var/shared

workdir /home/dev
env HOME /home/dev

# setup vim
# configure bash and vim
run svn checkout https://github.com/jayeve/terminal/trunk/dotfiles && \
    cp $HOME/dotfiles/bash/.bash_aliases $HOME && \
    cp $HOME/dotfiles/bash/.bash_utils $HOME && \
    cp $HOME/dotfiles/bash/.docker_profile $HOME/.bashrc && \
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

# set dev password; format => "user:password"
# so this password is monkey
run echo "dev:monkey" | chpasswd

run curl https://sh.rustup.rs -sSf | sh -s -- -y && echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc

#run chown -R dev: /home/dev
#user dev
entrypoint ["/bin/bash", "-i"]

