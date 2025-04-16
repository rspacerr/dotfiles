#! /bin/zsh

# git signing
export GPG_TTY=$TTY

setopt nobeep # never beep
setopt autocd # don't need cd

# disable ctrl-s freeze
stty stop undef
zle_highlight=('paste:none')

# history
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
bindkey '^p' history-search-backward
bindkey '^n' history-serach-forward

# arrow keys
bindkey ';5D' backward-word
bindkey ';5C' forward-word
bindkey ';6D' beginning-of-line
bindkey ';6C' end-of-line
