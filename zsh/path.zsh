# !/bin/zsh

export PATH="$PATH:/opt/nvim"

# requires node to be installed
function init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
#  TODO: 
# https://github.com/ohmyzsh/ohmyzsh/issues/9055#issuecomment-837565602

# requires go
export PATH=$PATH:/usr/local/go/bin

# pnpm
export PNPM_HOME="/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# jbang
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
