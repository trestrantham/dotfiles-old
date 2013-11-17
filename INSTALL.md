1. Install applications:
  - 1Password
  - Evernote
  - Fantastical
  - Flint
  - iPhoto
  - The Unarchiver
  - Tweetbot


In iTerm2, in Preferences -> Profiles -> Terminal, under "Terminal Emulation" you have "Report Terminal Type:" set to xterm-256color.

In your .vimrc, there are some options you can also set to make sure it's using 256 colors:

```
set background=dark
" solarized options
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
```

And one of those should work, but #1 first.
