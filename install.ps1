$BUNDLE_FOLDER="$HOME\.vim\bundle"
mkdir -p $BUNDLE_FOLDER
git clone https://github.com/lanyitin/lanyitin.vim $BUNDLE_FOLDER/lanyitin.vim


New-Item -ItemType HardLink -Target "$BUNDLE_FOLDER/lanyitin.vim/vimrc" -Path "$HOME/_vimrc"
New-Item -ItemType HardLink -Target "$BUNDLE_FOLDER/lanyitin.vim/gvimrc" -Path "$HOME/_gvimrc"

mkdir -p $HOME\AppData\Local\nvim

New-Item -ItemType HardLink -Target "$BUNDLE_FOLDER/lanyitin.vim/gvimrc" -Path "$HOME/AppData/Local/nvim/ginit.vim"
New-Item -ItemType HardLink -Target "$BUNDLE_FOLDER/lanyitin.vim/vimrc" -Path "$HOME/AppData/Local/nvim/init.vim"
