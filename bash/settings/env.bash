export PATH="./bin:~/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export EDITOR="vim"
export NODE_PATH="/usr/local/lib/node"
export LANG="en_US.UTF-8"
export PGLOG="/usr/local/var/postgres/server.log"
export TERM="screen-256color"

export GIT_PS1_SHOWDIRTYSTATE=Y

# Prevent duplicates and common history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
