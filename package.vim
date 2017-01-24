call plug#begin(expand('~/.vim/bundle/'))

" Git wrapper
Plug 'tpope/vim-fugitive'

" code lint
Plug 'benekastah/neomake'

" Useful snippets
if executable("python") && (has("python") || has("python3"))
Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
endif

"Intelligently toggle relative/absolute line number
Plug 'myusuf3/numbers.vim'

" Code indexing 
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Theme
Plug 'c9s/colorselector.vim'
Plug 'bling/vim-airline'
Plug 'nanotech/jellybeans.vim'


if executable("python") && (has("python") || has("python3"))
    Plug 'Valloric/YouCompleteMe'
endif

" Language related plugins
" Golang IDE
if executable("go")
Plug 'fatih/vim-go', {'filetypes': 'go'}
endif

" Typescript IDE
if executable("tsc")
Plug 'clausreinke/typescript-tools.vim', {'filetypes': 'typescript'}
Plug 'leafgarland/typescript-vim', {'filetypes': 'typescript'}
endif

Plug 'tpope/vim-markdown', {'filetypes': 'markdown'}

" Awesome start page
Plug 'mhinz/vim-startify'

" select " ' or tag around the word under course
Plug 'tpope/vim-surround'

" make % can match more than [ { " '
Plug 'tmhedberg/matchit'

" This package itself
Plug 'lanyitin/lanyitin.vim'

Plug 'junegunn/fzf.vim'

call plug#end()
