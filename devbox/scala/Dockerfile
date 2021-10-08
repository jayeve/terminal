from openjdk:11.0.6

# Env variables
arg SCALA_VERSION
env SCALA_VERSION ${SCALA_VERSION:-2.12.12}
arg SBT_VERSION
env SBT_VERSION ${SBT_VERSION:-1.5.5}
env SHELL /bin/bash
env CONTAINER_NAME scalabox

run mkdir -p /home/dev
workdir /home/dev
env HOME /home/dev

# to avoid prompts for apt-get update
env DEBIAN_FRONTEND=noninteractive
run apt-get update && apt-get install -yq \
    git \
    subversion \
    sudo \
    python \
    curl \
    tig \
    diffstat \
    pkg-config \
    cmake \
    bash-completion \
    build-essential \
    python3-pip \
    tcpdump \
    vim-gtk \
    vim \
    tmux \
    less \
    dnsutils \
    net-tools \
    ripgrep

# create /home/dev as working dir with vim/bash setup
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

# install scala
run apt-get install -yq openjdk-11-jre-headless
arg SCALA_VERSION
env SCALA_VERSION ${SCALA_VERSION:-2.12.12}
run wget www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb && \
    dpkg -i scala-$SCALA_VERSION.deb && \
    apt-get update && \
    apt-get -f install

# install sbt
run curl -L -o sbt-$SBT_VERSION.deb https://repo.scala-sbt.org/scalasbt/debian/sbt-$SBT_VERSION.deb && \
    dpkg -i sbt-$SBT_VERSION.deb && \
    rm sbt-$SBT_VERSION.deb && \
    apt-get update && \
    apt-get install sbt && \
    sbt sbtVersion

# install docker deps, docker, and docker-compose
run apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-get update && apt-get install -yq \
    docker-ce \
    docker-ce-cli \
    containerd.io

# get docker-compose?

# intall aws
run curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    ./aws/install -i /usr/local/aws -b /usr/local/bin

add setup.sh $HOME/setup.sh
run bash $HOME/setup.sh

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile source
# the bashrc
entrypoint ["/bin/bash", "-l"]
