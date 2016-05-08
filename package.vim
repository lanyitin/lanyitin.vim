if has('vim_starting')
    if !has("nvim")
        set nocompatible               " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/lanyitin.vim
endif

call plug#begin(expand('~/.vim/bundle/'))

" My Bundles here:

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plug 'kien/ctrlp.vim'
" using fzf instead

" Git wrapper
Plug 'tpope/vim-fugitive'

" code lint
Plug 'benekastah/neomake'

" Useful snippets
if executable("python")
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
endif

"Intelligently toggle relative/absolute line number
Plug 'myusuf3/numbers.vim'

" Code indexing 
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'


" Theme
Plug 'c9s/colorselector.vim'
Plug 'bling/vim-airline'
Plug 'nanotech/jellybeans.vim'


" Autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }


Plug 'zchee/deoplete-clang'

" Tmux integration
if executable("tmux")
Plug 'benmills/vimux'
endif

" Language related plugins
" Golang IDE
if executable("go")
Plug 'fatih/vim-go', {'filetypes': 'go'}
Plug 'benmills/vimux-golang', {'depends': 'benmills/vimux', 'filetypes': 'go'}
Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

" Python
if executable("nose")
Plug 'pitluga/vimux-nose-test', {'filetypes': 'python', 'depends': 'benmills/vimux'}
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
Plug 'https://github.com/lanyitin/lanyitin.vim'

call plug#end()
filetype plugin indent on
