call plug#begin(expand('~/.vim/bundle/'))

" Git wrapper
Plug 'tpope/vim-fugitive'

" code lint
Plug 'dense-analysis/ale'

"Intelligently toggle relative/absolute line number
Plug 'myusuf3/numbers.vim'

" Code indexing
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Theme
Plug 'c9s/colorselector.vim'
Plug 'bling/vim-airline'
Plug 'nanotech/jellybeans.vim'


" Awesome start page
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf.vim'

Plug 'samoshkin/vim-mergetool'

" This package itself
Plug 'lanyitin/lanyitin.vim'

call plug#end()
