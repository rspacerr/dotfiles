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
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

## search through history
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end \
                history-search-end
zle -N history-beginning-search-forward-end \
                history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

# arrow keys
bindkey ';5D' backward-word
bindkey ';5C' forward-word
bindkey ';6D' beginning-of-line
bindkey ';6C' end-of-line
