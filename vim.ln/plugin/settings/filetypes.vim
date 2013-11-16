" File types
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
