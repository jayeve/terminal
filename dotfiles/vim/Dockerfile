from alpine

run apk add --no-cache \
    curl \
    git \
    subversion \
    vim \
    py3-pip \
    bash \
    the_silver_searcher \
    build-base \
    python3-dev \
    openssh

workdir /home/dev
env HOME /home/dev

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

run mkdir $HOME/strava

env FZF_DEFAULT_COMMAND="ag -l"
env FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

run adduser -D -u 1000 dev && chown -R dev: /home/dev
user dev
entrypoint ["/bin/bash", "-i" ]
