# source bashrc first, then add everything here
if [ -f "${HOME}/.bashrc" ] ; then
. "${HOME}/.bashrc"
fi

if [ -f "${HOME}/.aws/token_profile" ] ; then
. ${HOME}/.aws/token_profile
fi

# source work functions
if [ -f "${HOME}/.work_functions.bash" ] ; then
. ${HOME}/.work_functions.bash
fi

if [ -f "${HOME}/.strava/env.bash" ] ; then
. ${HOME}/.strava/*.bash
fi

# trynna be a hacksoar
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/etcher-cli:$PATH"
export SPARK_HOME=/usr/local/lib/python3.6/site-packages/pyspark
eval "$(rbenv init -)"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

source <(kubectl completion bash)
