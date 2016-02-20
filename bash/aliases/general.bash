alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias cdd='cd ~/Dropbox/Development'
alias cdD='cd ~/Development'
alias cddf='cd ~/.dotfiles'
alias cde='cd ~/Dropbox/Development/elixir'
alias cdi='cd ~/Dropbox/Development/ios'
alias cdr='cd ~/Dropbox/Development/rails'
alias cda='cd ~/Development/runway/repos'
alias vim='nvim'

alias dbmg="[ -f mix.exs ] && mix ecto.migrate || rake db:migrate"
alias dbrb="[ -f mix.exs ] && mix ecto.rollback || rake db:rollback"

alias console="[ -f mix.exs ] && iex -S mix || bundle exec rails c"
alias con="console"

alias server="[ -f mix.exs ] && mix phoenix.server || bundle exec rails s"
alias serv="server"

alias stats="[ -f mix.exs ] && mix credo -a"
alias statss="stats --strict"
alias statso="stats --one-line"
