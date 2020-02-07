if has('vim_starting')
    scriptencoding utf-8
    set encoding=utf-8
    set fileencoding=utf-8
	set runtimepath+=~/.vim/bundle/lanyitin.vim
endif

source ~/.vim/bundle/lanyitin.vim/package.vim
source ~/.vim/bundle/lanyitin.vim/utils.vim

syntax on

set shortmess=at

" always show current position
set ruler

" highlight search
set hls

" show line number
set number

" a buffer becomes hidden when it is anandoned
set hid

" show matching brackets when cusor is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell

" use spaces instead of tab
set expandtab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" auto reload file when the file is changed from outside
set autoread

" Unknown effect
set wildmenu
set wildignore=*.o,*~,*pyc

" to avoid uncorrect indent after pasting things
" set paste

" highlight current line
set cursorline


set title

" set the leader key to comma
let mapleader = ','

noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>g :NERDTreeToggle<cr>
noremap <F1> :Startify<cr>
noremap <F2> :FZF<cr>

" Treat long lines as break lines (useful when moving around in them)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
imap ;; <Esc>
nmap ;; :

set background=dark
if !has('gui')
    colorscheme desert
else
    colorscheme jellybeans
endif


let g:airline#extensions#tabline#enabled = 1
if HasFont("Powerline")
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif
set laststatus=2

let g:startify_bookmarks = ['~/.vimrc', '~/.gvimrc', '~/.vim/bundle/lanyitin.vim/package.vim']
let g:startify_list_order = ['bookmarks', 'files', 'dir', 'sessions']

" auto reload configuration file after save
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc

" remove tailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" close autocomplete Preview automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**


let g:mergetool_layout = 'bmr'

" set shell=pwsh.exe
