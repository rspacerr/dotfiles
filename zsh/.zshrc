#zmodload zsh/zprof

for conffile in "${HOME}"/.dotfiles/zsh/*.zsh; do
    source "${conffile}"
done

unset conffile

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# nvim discord presence
# https://github.com/vyfor/cord.nvim/wiki/Special-Environments

#nvim() {
#    if ! pidof socat > /dev/null 2>&1; then
#        [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
#        socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
#            EXEC:"npiperelay.exe //./pipe/discord-ipc-0" 2>/dev/null &
#    fi

#    command nvim "$@"
#}

#zprof
