# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# make tmux play well with fancy prompt
alias tmux="TERM=screen-256color-bce tmux"

# a few helpful and silly git aliases
alias getdefault="git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'"
alias setdefault="git remote set-head origin --auto"
alias yoda="git push --force"
alias fixup="git commit --fixup=HEAD"
alias amend="git commit --amend"
alias squash="git rebase -i origin/master"
alias glog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias prune="docker system prune"
alias token="~/strava/configuration/scripts/aws-token"
alias python="python3.7"

alias vi="vim"
alias all="vi -p *"

alias sss="source ~/.bash_profile"

alias ifconfiga="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+'"
