pi_home=/home/pi

apt-get update && apt-get install -yq \
  vim-gtk3 \
  python3-pip

pip3 install sexpdata websocket-client neovim
# setup vim
cd $pi_home && git clone https://github.com/jayeve/terminal.git
cd $pi_home/terminal/dotfiles/vim
bash ./install.sh

# recursively give permissions back to user
chmod 777 $pi_home/.vim
chmod 777 $pi_home/.vimrc
find $pi_home/.vim -type d -exec chmod 777 {} \;
