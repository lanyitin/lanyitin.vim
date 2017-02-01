call plug#begin(expand('~/.vim/bundle/'))

" Git wrapper
Plug 'tpope/vim-fugitive'

" code lint
Plug 'vim-syntastic/syntastic'

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

if executable("fzf")
    Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
    Plug 'junegunn/fzf.vim'
else
    if has("unix")
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    else
        Plug 'kien/ctrlp.vim'
    endif
endif

" Async IO
if !has("nvim")
    Plug 'tpope/vim-dispatch'
endif

" Powerful search plugin
if executable("ag") || executable("rg")
    Plug 'wincent/ferret'
endif

" This package itself
Plug 'lanyitin/lanyitin.vim'

call plug#end()
