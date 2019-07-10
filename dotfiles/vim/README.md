# Install

```bash
git clone https://github.com/jayeve/terminal.git && cd dotfiles/vim && ./install.sh
```

# Try it from a docker container

```bash
docker pull jayeve/vimbox
```

if you get this error on startup
> [vim-hug-neovim-rpc] failed executing: pythonx import pynvim
try installing pynvim
```bash
pip3 install pynvim
```
