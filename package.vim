if has('vim_starting')
    if !has("nvim")
        set nocompatible               " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/Vundle.vim/
endif

call vundle#begin(expand('~/.vim/bundle/'))

" Let Plugin manage Plugin
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" code lint
Plugin 'scrooloose/syntastic'

" Useful snippets
if executable("python")
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
endif

"Intelligently toggle relative/absolute line number
Plugin 'myusuf3/numbers.vim'

" Code indexing 
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'


" Theme
Plugin 'c9s/colorselector.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" Autocomplete
if executable("gcc") && has("unix")
Plugin 'Valloric/YouCompleteMe'
elseif has("lua")
Plugin("Shougo/neocomplete.vim")
endif

" Read-Eval-Print-Loop
if has("nvim") != 1
Plugin 'Shougo/vimshell.vim'
endif

" Tmux integration
if executable("tmux")
Plugin 'benmills/vimux'
endif

" Language related plugins
" Golang IDE
if executable("go")
Plugin 'fatih/vim-go', {'filetypes': 'go'}
Plugin 'benmills/vimux-golang', {'depends': 'benmills/vimux', 'filetypes': 'go'}
endif

" Python
if executable("nose")
Plugin 'pitluga/vimux-nose-test', {'filetypes': 'python', 'depends': 'benmills/vimux'}
endif

" Typescript IDE
if executable("tsc")
Plugin 'clausreinke/typescript-tools.vim', {'filetypes': 'typescript'}
Plugin 'leafgarland/typescript-vim', {'filetypes': 'typescript'}
endif

Plugin 'tpope/vim-markdown', {'filetypes': 'markdown'}

" Awesome start page
Plugin 'mhinz/vim-startify'

" select " ' or tag around the word under course
Plugin 'tpope/vim-surround'

" make % can match more than [ { " '
Plugin 'tmhedberg/matchit'

" This package itself
Plugin 'https://bitbucket.org/lanyitin/lanyitin.vim', {'type' : 'git'}

call vundle#end()
filetype plugin indent on
