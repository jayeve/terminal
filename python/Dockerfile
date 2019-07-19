from jayeve/vimbox:latest

env CONTAINER_NAME pybox

# add dev user
run adduser --disabled-password --gecos '' dev && chown -R dev: /home/dev
env USER dev

env SHELL /bin/bash
workdir /home/dev

user dev

# use a login shell because it looks for ~/.bash_profile first.
# interactive shell looks for ~/.bashrc first and I don't have
# as the first rc in the sourcing path. My bash_profile source
# the bashrc
entrypoint ["/bin/bash", "-l"]
