export HOMEBREW="/usr/local/bin:/usr/local/sbin"
export PATH="./bin:~/bin:$HOMEBREW:/usr/local/share/npm/bin:$PATH"
export EDITOR="vim"
export NODE_PATH="/usr/local/lib/node"
export LANG="en_US.UTF-8"
export PGLOG="/usr/local/var/postgres/server.log"
export TERM="xterm-256color"

export GIT_PS1_SHOWDIRTYSTATE=Y

# Prevent duplicates and common history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Rubies source directory
export SRC_DIR="$HOME/.rubies/src"
