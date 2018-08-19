#/bin/bash
# must be run as elevated user
pi_home=/home/pi

apt-get update && apt-get install -yq \
  python-pip \
  git \
  mosh \
  silversearcher-ag \
  vim \
  tmux \
  nmap \
  tree

# download rust
curl https://sh.rustup.rs -sSf | sh
source ~/.profile
source ~/.cargo/env

# Docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
# add docker group if it doesn't exist
groupadd docker
usermod --append --groups  docker pi
gpasswd -a pi docker

# docker-compose
pip install docker-compose

# add fzf. It's hard because raspberry :/
FZF_VERSION='0.16.2'
FZF_BUILD=fzf-${FZF_VERSION}-linux_arm7
wget -O fzf.tgz https://github.com/junegunn/fzf-bin/releases/download/${FZF_VERSION}/${FZF_BUILD}.tgz
tar xzf fzf.tgz
mv ${FZF_BUILD} /usr/local/bin/fzf
rm $pi_home/*.tgz
wget -O $pi_home/.fzf-key-bindings.bash https://raw.githubusercontent.com/jayeve/terminal/master/raspberry/fzf/key-bindings.bash
#TODO still need to create .fzf.bash and source it

# setup vim
cd $pi_home && git clone https://github.com/jayeve/vimrc.git
mv $pi_home/vimrc $pi_home/.vim_runtime
bash $pi_home/.vim_runtime/install_awesome_vimrc.sh
chmod 777 $pi_home/.vim_runtime
