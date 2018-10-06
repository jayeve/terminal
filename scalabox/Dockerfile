from openjdk:8

run apt-get update -y
run apt-get install -y git
run apt-get install -y sudo
run apt-get install -y python
run apt-get install -y curl
run apt-get install -y vim
run apt-get install -y diffstat
run apt-get install -y pkg-config
run apt-get install -y cmake
run apt-get install -y build-essential
run apt-get install -y tcpdump
run apt-get install -y tmux
run apt-get install -y dnsutils
run apt-get install -y net-tools

# Setup home environment
run useradd dev
run mkdir /home/dev && chown -R dev: /home/dev
run mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
env PATH /home/dev/bin:$PATH
env PKG_CONFIG_PATH /home/dev/lib/pkgconfig
env LD_LIBRARY_PATH /home/dev/lib

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
run mkdir /var/shared/
run touch /var/shared/placeholder
run chown -R dev:dev /var/shared
volume /var/shared

workdir /home/dev
env HOME /home/dev

# setup vim
run git clone https://github.com/jayeve/vimrc.git
run mv $HOME/vimrc $HOME/.vim_runtime
run bash $HOME/.vim_runtime/install_awesome_vimrc.sh

# setup bash + fzf
run svn checkout https://github.com/jayeve/terminal/trunk/scalabox/dotfiles
run cp $HOME/dotfiles/.bash* $HOME
run cp $HOME/dotfiles/.tmux* $HOME
run rm -r dotfiles
run git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
run bash $HOME/.fzf/install

# Link in shared parts of the home directory
run ln -s /var/shared/.ssh
run ln -s /var/shared/.bash_history
run ln -s /var/shared/.maintainercfg

# set root password; format => "user:password"
# so this password is root
# operate as root using 'su -'
run echo "root:root" | chpasswd

# set dev password; format => "user:password"
# so this password is monkey
run echo "dev:monkey" | chpasswd
# setup scalabox project with a build.sbt # install sbt
arg sbt_version=1.2.3
run curl -L -o sbt-${sbt_version}.deb http://dl.bintray.com/sbt/debian/sbt-${sbt_version}.deb
run dpkg -i sbt-${sbt_version}.deb
run rm sbt-${sbt_version}.deb
run apt-get update
run apt-get install sbt
run su - dev -c "sbt sbtVersion"
run apt-get install -y scala
add setup.sh $HOME/setup.sh
run bash $HOME/setup.sh

run chown -R dev: /home/dev
run bash $HOME/.bash_profile
user dev
