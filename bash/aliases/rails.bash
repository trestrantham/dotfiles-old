alias rc='rails c'
alias rs='rails s'
alias rg='rails g'

alias rdc='rake db:create'
alias rdd='rake db:drop'
alias rdm='rake db:migrate db:test:prepare'
alias rdsl='rake db:schema:load'
alias rdtp='rake db:test:prepare'

alias rgm='rails generate model'
alias rgmg='rails generate migration'
alias rgc='rails generate controller'

alias rerd='bundle exec rake erd attributes=foreign_keys,inheritance orientation=vertical filetype=dot && dot -Tpdf erd.dot > erd.pdf && rm erd.dot && open erd.pdf'
# alias cov='COVERAGE=true rspec && open coverage/index.html'
