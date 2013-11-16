for f in `find $( dirname "$BASH_SOURCE[0]" ) -name '*.ln'`; do
  filename=$(basename "$f")
  if [ -e "$HOME/.${filename%.ln}" ]
  then
    rm "$HOME/.${filename%.ln}"
  fi

  ln -s "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
done

vim -u ~/.vim/bundles.vim +BundleInstall +qall
