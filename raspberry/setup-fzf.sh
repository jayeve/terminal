#!/bin/bash
pi_home=/home/pi
FZF_VERSION='0.16.2'
FZF_BUILD=fzf-${FZF_VERSION}-linux_arm7
wget -O fzf.tgz https://github.com/junegunn/fzf-bin/releases/download/${FZF_VERSION}/${FZF_BUILD}.tgz
tar xzf fzf.tgz
mv ${FZF_BUILD} /usr/local/bin/fzf
rm -rf $pi_home/.fzf
mkdir -p $pi_home/.fzf
cp $pi_home/terminal/raspberry/dotfiles/fzf/.key-bindings.bash $pi_home/.fzf/.key-bindings.bash
cp $pi_home/terminal/raspberry/dotfiles/fzf/.completion.bash $pi_home/.fzf/.completion.bash
cp $pi_home/terminal/raspberry/dotfiles/fzf/.fzf.bash $pi_home/.fzf.bash
chmod 777 $pi_home/.fzf*
find $pi_home/.fzf -type d -exec chmod 777 {} \;
