# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.bash_utils ]; then
  . ~/.bash_utils
fi

# fancy prompt. assumes xterm-256color
# --------------------------------------------------------------------------------------------------
PS1="$RED\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[$RED\342\234\227$COLL]\342\224\200\")\
[$LITEBLUE\w$RED]\
\342\224\200[$YELLOW\$(parse_git_branch)$RED]\
\342\224\200[${LITEBLUE}jobs: \j$RED]\
\n$RED\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]${WHITE}raspi:\u $YELLOW\\$ \[\e[0m\]"
# --------------------------------------------------------------------------------------------------

# fuzzy finder for file search and command history
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# place to keep all alias
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
