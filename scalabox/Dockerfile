from openjdk:8

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
run git clone https://github.com/jayeve/vimrc.git && \
    mv $HOME/vimrc $HOME/.vim_runtime && \
    bash $HOME/.vim_runtime/install_awesome_vimrc.sh && \
    svn checkout https://github.com/jayeve/terminal/trunk/scalabox/dotfiles && \
    cp $HOME/dotfiles/.bash* $HOME && \
    cp $HOME/dotfiles/.tmux* $HOME && \
    rm -r dotfiles && \
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
    bash $HOME/.fzf/install && \
    ln -s /var/shared/.ssh && \
    ln -s /var/shared/.bash_history && \
    ln -s /var/shared/.maintainercfg && \
    echo "root:root" | chpasswd

# set dev password; format => "user:password"
# so this password is monkey
run echo "dev:monkey" | chpasswd
arg sbt_version=1.2.3
run curl -L -o sbt-${sbt_version}.deb http://dl.bintray.com/sbt/debian/sbt-${sbt_version}.deb && \
    dpkg -i sbt-${sbt_version}.deb && \
    rm sbt-${sbt_version}.deb && \
    apt-get update && apt-get install -yq sbt scala
add setup.sh $HOME/setup.sh
run bash $HOME/setup.sh && \
    su - dev -c "cd scalabox;sbt sbtVersion"

run chown -R dev: /home/dev
run bash $HOME/.bash_profile
user dev
