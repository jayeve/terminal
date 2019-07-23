# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# make tmux play well with fancy prompt
alias tmux="TERM=screen-256color-bce tmux"

# a few helpful and silly git aliases
alias yoda="git push --force"
alias amend="git commit --amend"
alias squash="git rebase -i origin/master"

# handy open all files in vim
alias all="vi -p *"
alias sss="source ~/.bash_profile"
alias ifconfiga="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+'"
