#/bin/sh
BUNDLE_FOLDER=$HOME/.vim/bundle
mkdir -p $BUNDLE_FOLDER
git clone https://github.com/Shougo/neobundle.vim $BUNDLE_FOLDER/neobundle.vim
git clone https://github.com/lanyitin/lanyitin.vim $BUNDLE_FOLDER/lanyitin.vim
ln -s $BUNDLE_FOLDER/lanyitin.vim/vimrc $HOME/.vimrc
ln -s $BUNDLE_FOLDER/lanyitin.vim/gvimrc $HOME/.gvimrc

if which nvim >/dev/null; then
    mkdir -p $HOME/.config/nvim
    ln -s $BUNDLE_FOLDER/lanyitin.vim/vimrc $HOME/.config/nvim/init.vim
fi
