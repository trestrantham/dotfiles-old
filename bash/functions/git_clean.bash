git_clean() {
  git checkout master
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
  git remote prune origin
}
