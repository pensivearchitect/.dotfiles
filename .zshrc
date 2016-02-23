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
export PATH="$HOME/.multirust/toolchains/stable/cargo/bin:$PATH"
export AWS_ACCESS_KEY=AKIAI2LRUVEASGMQGZDA
export AWS_SECRET_KEY=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
export BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
export RUST_SRC_PATH="$HOME/src/rust/src"
export EDITOR='vim'
export VISUAL='vim'
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
eval "$(rbenv init -)"
