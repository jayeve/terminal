# MacOS specific aliases go in here
alias batt="pmset -g batt"
parse_battery_power() {
  pmset -g batt | awk '/%/' | awk '{print $3}' | cut -d ';' -f 1
}

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
#export PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

#source <(kubectl completion bash)

# docker completions
curl -XGET https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker > $(brew --prefix)/etc/bash_completion.d/docker

function prj {
  local base=$HOME/strava
  if [ ! -d "$HOME/strava" ]; then
    mkdir $HOME/strava
  fi
  local project=$1
  local project_dir=$base/$project
  if [ ! -d "$project_dir" ]; then
    cd $base && git clone git@github.com:strava/$project.git
  fi

  cd $project_dir
}

_prj() {
  local cur prev opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts=$(cd $HOME/strava ; ls)
  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
