# Local tmux
alias t='tmux'
alias tn='t new-session -s'
alias ta='t attach -t'
alias tls='t list-sessions'

# Socket tmux
alias T='tmux -S ~/.tmux.socket'
alias Tn='T new -s'
alias Ta='T attach -t'
alias Tnp='ssh-agent Tn pair'
alias Tls='T list-sessions'
