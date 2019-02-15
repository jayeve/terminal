from openjdk:8

arg sbt_version=0.13.16

run apt-get update && apt-get install -yq git \
    sudo \
    python \
    curl \
    vim \
    diffstat \
    pkg-config \
    cmake \
    build-essential \
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
run apt-get install -yq python3-pip python3
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
run curl -L -o sbt-${sbt_version}.deb http://dl.bintray.com/sbt/debian/sbt-${sbt_version}.deb && \
    dpkg -i sbt-${sbt_version}.deb && \
    rm sbt-${sbt_version}.deb && \
    apt-get update && apt-get install -yq sbt scala
add setup.sh $HOME/setup.sh
#run bash $HOME/setup.sh && \
#    su - dev -c "cd scalabox;sbt sbtVersion"
run bash $HOME/setup.sh

#run chown -R dev: /home/dev
#user dev
entrypoint ["/bin/bash", "-i"]

