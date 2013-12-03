if has('vim_starting')
    if !has("nvim")
        set nocompatible               " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
" My Bundles here:

" Git wrapper
NeoBundle 'tpope/vim-fugitive'

" Quickly switch to other buffer/file
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Kocha/vim-unite-tig'

" code lint
NeoBundle 'scrooloose/syntastic'

" Useful snippets
if executable("python")
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
endif

"Intelligently toggle relative/absolute line number
NeoBundle 'myusuf3/numbers.vim'

" Code indexing 
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'


" Theme
NeoBundle 'c9s/colorselector.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'

" Autocomplete
if executable("gcc") && has("unix")
NeoBundle 'Valloric/YouCompleteMe'
elseif has("lua")
NeoBundle("Shougo/neocomplete.vim")
endif

" Read-Eval-Print-Loop
if has("nvim") != 1
NeoBundle 'Shougo/vimshell.vim'
endif

" Tmux integration
if executable("tmux")
NeoBundle 'benmills/vimux'
endif

" Language related plugins
" Golang IDE
if executable("go")
NeoBundleLazy 'fatih/vim-go', {'filetypes': 'go'}
NeoBundleLazy 'benmills/vimux-golang', {'depends': 'benmills/vimux', 'filetypes': 'go'}
endif

" Python
if executable("nose")
NeoBundleLazy 'pitluga/vimux-nose-test', {'filetypes': 'python', 'depends': 'benmills/vimux'}
endif

" Typescript IDE
if executable("tsc")
NeoBundleLazy 'clausreinke/typescript-tools.vim', {'filetypes': 'typescript'}
NeoBundleLazy 'leafgarland/typescript-vim', {'filetypes': 'typescript'}
endif

NeoBundleLazy 'tpope/vim-markdown', {'filetypes': 'markdown'}

" Awesome start page
NeoBundle 'mhinz/vim-startify'

" select " ' or tag around the word under course
NeoBundle 'tpope/vim-surround'

" make % can match more than [ { " '
NeoBundle 'tmhedberg/matchit'

NeoBundleLazy 'jceb/vim-orgmode', {'filetypes': 'org'}

" using C-A C-X to increase or descrease date or time
NeoBundle 'tpope/vim-speeddating'

NeoBundle 'vim-scripts/utl.vim'

NeoBundle 'vim-scripts/SyntaxRange'

NeoBundle '4Evergreen4/vim-hardy'

" This package itself
NeoBundle 'https://bitbucket.org/lanyitin/lanyitin.vim', {'type' : 'git'}

call neobundle#end()


filetype plugin indent on
NeoBundleCheck
