# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# TODO: Sort out better config for plugin directories
source ${HOME}/.powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt interactivecomments
# source ${PLUGIN_DIR}/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# source ${HOME}/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO maybe move this somewhere else
# zsh-autocomplete configs
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
