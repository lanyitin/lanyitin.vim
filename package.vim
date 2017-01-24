call plug#begin(expand('~/.vim/bundle/'))

" Git wrapper
Plug 'tpope/vim-fugitive'

" code lint
Plug 'benekastah/neomake'

" Useful snippets
if executable("python") && (has("py") || has("py3"))
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

if has("nvim")
    " Autocomplete
    function! DoRemote(arg)
      UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

    if executable("clang")
    Plug 'zchee/deoplete-clang'
    endif
    Plug 'zchee/deoplete-jedi'
else
    if has("py") || has("py3")
        Plug 'Valloric/YouCompleteMe'
    endif
endif

" Language related plugins
" Golang IDE
if executable("go")
Plug 'fatih/vim-go', {'filetypes': 'go'}
Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

" Typescript IDE
if executable("tsc")
Plug 'clausreinke/typescript-tools.vim', {'filetypes': 'typescript'}
Plug 'leafgarland/typescript-vim', {'filetypes': 'typescript'}
Plug 'mhartington/deoplete-typescript'
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
