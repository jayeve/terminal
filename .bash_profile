# source bashrc first, then add everything here
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# used by https://github.com/jayeve/vimrc to support command line
# fuzzy finder for file search and command history
alias tmux="TERM=screen-256color-bce tmux"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# a few helpful and silly git aliases
alias yoda="git push --force"
alias amend="git commit --amend"
alias squash="git rebase -i origin/master"
