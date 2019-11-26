from jayeve/vimbox as builder

from openjdk:8

workdir /home/dev
env HOME /home/dev

# take only what we need from base image jayeve/vimbox (builder)
copy --from=builder /home/dev/.vim /home/dev/.vim
copy --from=builder /home/dev/.vimrc /home/dev/.vimrc
copy --from=builder /home/dev/.bash_profile /home/dev/.bash_profile
copy --from=builder /home/dev/.bashrc /home/dev/.bashrc
copy --from=builder /home/dev/.bash_aliases /home/dev/.bash_aliases
copy --from=builder /home/dev/.bash_utils /home/dev/.bash_utils
copy --from=builder /home/dev/.fzf.bash /home/dev/.fzf.bash
copy --from=builder /home/dev/.fzf /home/dev/.fzf

# install scala + sbt
arg sbt_version=0.13.16
run apt-get update && apt-get install -yq \
    git \
    bash-completion \
    sudo \
    python \
    curl \
    vim \
    diffstat \
    pkg-config \
    cmake \
    build-essential \
    tcpdump \
    dnsutils \
    net-tools \
    silversearcher-ag

run curl -L -o sbt-${sbt_version}.deb http://dl.bintray.com/sbt/debian/sbt-${sbt_version}.deb && \
    dpkg -i sbt-${sbt_version}.deb && \
    rm sbt-${sbt_version}.deb && \
    apt-get update && apt-get install -yq sbt scala
add setup.sh $HOME/setup.sh
#run bash $HOME/setup.sh && \
run adduser --disabled-password --gecos '' dev && chown -R dev: /home/dev
user dev

# run sbtVersion to "download the internet" in the image
run bash $HOME/setup.sh && sbt sbtVersion

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile source
# the bashrc
entrypoint ["/bin/bash", "-l"]
