#/bin/sh
BUNDLE_FOLDER=$HOME/.vim/bundle
mkdir -p $BUNDLE_FOLDER

git clone https://github.com/lanyitin/lanyitin.vim $BUNDLE_FOLDER/lanyitin.vim

curl -fLo ~/.vim/bundle/lanyitin.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.vim/bundle/lanyitin.vim/plugin/fzf.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim

ln -s $BUNDLE_FOLDER/lanyitin.vim/vimrc $HOME/.vimrc
ln -s $BUNDLE_FOLDER/lanyitin.vim/gvimrc $HOME/.gvimrc

if which nvim >/dev/null; then
    mkdir -p $HOME/.config/nvim
    ln -s $BUNDLE_FOLDER/lanyitin.vim/vimrc $HOME/.config/nvim/init.vim
    ln -s $BUNDLE_FOLDER/lanyitin.vim/gvimrc $HOME/.config/nvim/ginit.vim
fi
