#/bin/bash
# must be run as elevated user
pi_home=/home/pi

apt-get update && apt-get install -yq \
  python-pip \
  git \
  mosh \
  silversearcher-ag \
  apt-transport-https \
  curl \
  tmux \
  nmap \
  tree \
  openjdk-9-jre \
  openjdk-9-jdk \
  pcregrep

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

# setup vim
bash $pi_home/terminal/raspberry/setup-vim.sh

# setup bash
cp $pi_home/terminal/raspberry/dotfiles/bash/.bash* $pi_home && chmod 777 $pi_home/.bash*

# setup fzf
bash $pi_home/terminal/raspberry/setup-fzf.sh
rm -rf $pi_home/terminal

# install spark
wget -O spark-2.3.1-bin-hadoop2.7.tgz https://www.apache.org/dyn/closer.lua/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar -xzf spark-2.3.1-bin-hadoop2.7.tgz
mv spark-1.5.2-bin-hadoop2.6 /opt/spark
# TODO change permissions

# ruby shits
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $pi_home/.profile
git clone https://github.com/rbenv/ruby-build.git $pi_home/.rbenv/plugins/ruby-build
echo 'eval "$(rbenv init -)"' >> $pi_home/.profile
# change bash prompt

# TODO: use me =>  make things available to pi user
# chown $(id -u):$(id -g) file

# kubernetes setup gotchyas
# add cgroups to /boot/cmdline.txt: cgroup_memory=memory cgroup_enable=memory
# disable swap: sudo swapoff -a
# generate token: kubeadm token create (no sudo or it'll hang)
# on the master, you have to export the config to $HOME/.kube/config so
# kubectl is able to find it
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl

apt -y autoremove
