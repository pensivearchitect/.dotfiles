#!/bin/bash
RUBY_VERSION='2.3.1'
if [ -s /etc/issue ]
then
  DISTRO=`cat /etc/issue`
else
  DISTRO=''
fi
if [ -z ${DISTRO+unset} ]
then
  echo cannot determine what linux distro is running
  exit
fi
if [[ $DISTRO =~ Antergos ]]
then
  ARCH_PACKAGES='postgresql redis the_silver_searcher tmux htop qt5-base qt5-webkit docker clang llvm keychain neovim xclip python2-pip cmake'
  sudo pacman -S $ARCH_PACKAGES
  sudo systemctl enable postgresql
  sudo systemctl start postgresql
  sudo su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/ postgres/data'"
  sudo systemctl enable redis
  sudo systemctl start redis
  USER=`whoami`
  sudo su - postgres -c "createuser $USER --superuser"
  createdb josh
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln ~/.dotfiles/.{vimrc,spacemacs,aliases,zshrc} ~/
curl https://sh.rustup.rs -sSf | sh
cargo install racer
vim +PluginInstall +qall
cd ~/.vim/bundle/vimproc
make
cd ../YouCompleteMe
./install.py --racer-completer
cat "gem: --no-document" > ~/.gemrc
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
CONFIGURE_OPTS="--enable-shared --enable-jemalloc" rbenv install $RUBY_VERSION
