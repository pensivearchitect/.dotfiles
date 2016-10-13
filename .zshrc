# Created by newuser for 5.2

alias vi=vim
source ~/antigen.zsh
source ~/.aliases
antigen use oh-my-zsh
antigen bundle rimraf/k
antigen theme clean
antigen apply

export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="/home/josh/.nvm"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cask/bin:$PATH"
export BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
export RUST_SRC_PATH="$HOME/src/rust/src"
export EDITOR='vim'
export VISUAL='vim'
source $HOME/.cargo/env
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
eval "$(rbenv init -)"
eval $(keychain --eval --quiet id_rsa)
