# Console
alias console="[ -f mix.exs ] && iex -S mix || bundle exec rails c"
alias con="console"

# Server
alias server="[ -f mix.exs ] && mix phoenix.server || bundle exec rails s"
alias serv="server"

# Stats
alias stats="[ -f mix.exs ] && mix credo -a"
alias statss="stats --strict"
alias statso="stats --one-line"

# Database
alias dbm="[ -f mix.exs ] && mix ecto.migrate || rake db:migrate"
alias dbrb="[ -f mix.exs ] && mix ecto.rollback || rake db:rollback"
alias dbmg="[ -f mix.exs ] && mix ecto.gen.migration || rails generate migration"
