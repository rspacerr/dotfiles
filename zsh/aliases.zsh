#! /bin/zsh

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'

alias vi='nvim'
alias vim='nvim'

alias dot='cd ~/.dotfiles/'
alias dev='cd ~/dev/'

alias ga='git add'
alias gst='git status'

alias python='python3'
alias py='python3'

# misc
alias mkdocs='pipenv install; pipenv run mkdocs build --clean; pipenv run mkdocs serve --livereload'

# wsl only 
if uname -r | grep -qi 'Microsoft' ; then
  # open file explorer
  alias explorer="explorer.exe ."

  # open vscode
  alias code="$(wslpath $USERPROFILE)/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
fi
