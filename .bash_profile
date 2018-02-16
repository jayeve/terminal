# source bashrc first, then add everything here
if [ -f "${HOME}/.bashrc" ] ; then
. "${HOME}/.bashrc"
fi

# trynna be a hacksoar
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"
