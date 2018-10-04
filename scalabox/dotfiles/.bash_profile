# source bashrc first, then add everything here
if [ -f "${HOME}/.bashrc" ] ; then
. "${HOME}/.bashrc"
fi

export SPARK_HOME=/usr/local/lib/python3.6/site-packages/pyspark
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
