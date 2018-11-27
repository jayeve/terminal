pi_home=/home/pi
# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/bin/fzf/* ]]; then
  export PATH="$PATH:/usr/local/bin/fzf"
fi

# Auto-completion
# ---------------
 source "$pi_home/.fzf/.completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$pi_home/.fzf/.key-bindings.bash"
export FZF_DEFAULT_COMMAND="ag -l"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
