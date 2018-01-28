# terminal

## xcode
First, install xcode dev tools

`xcode-setup --install`

## Homebrew

[Homebrew](https://brew.sh/) is a useful package manager available for MacOS.

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## fuzzyfinder
This tool allows you to quickly search a file directory (ctrl+t) or
your command history (ctrl+r)

`brew install fzf`

To install useful key bindings and fuzzy completion:

`$(brew --prefix)/opt/fzf/install`

## Docker for mac
Docker is like github for runnable code. It's a liteweight virtual machine that emulates
the Linux environment. It's used to quickly download and deploy processes/services in
containers.

https://www.docker.com/docker-mac

## Tmux + vim key bindings
I develop most code I write in vi. These bindings allow for easy maneuverability between files
opened in vi and command shells in other panes of a tmux process Add this to `~/.tmux.conf`

Smart pane switching with awareness of Vim splits.
See: https://github.com/christoomey/vim-tmux-navigator

```
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
    bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
    bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
    bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
    bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
    bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
    bind-key -T copy-mode-vi C-h select-pane -L
    bind-key -T copy-mode-vi C-j select-pane -D
    bind-key -T copy-mode-vi C-k select-pane -U
    bind-key -T copy-mode-vi C-l select-pane -R
    bind-key -T copy-mode-vi C-\ select-pane -l
```
