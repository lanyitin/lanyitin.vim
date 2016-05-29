if has('vim_starting')
    scriptencoding utf-8
    set encoding=utf-8
    set fileencoding=utf-8
	set runtimepath+=~/.vim/bundle/lanyitin.vim
endif

source ~/.vim/bundle/lanyitin.vim/package.vim
source ~/.vim/bundle/lanyitin.vim/utils.vim

syntax on

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

" use system clipboard by default
if has("win32")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" set the leader key to comma
let mapleader = ','

noremap <leader>t :TagbarToggle<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <F1> :Startify<cr>

" Treat long lines as break lines (useful when moving around in them)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

set background=dark
colorscheme jellybeans


let g:airline#extensions#tabline#enabled = 1
if HasFont("Powerline")
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif
set laststatus=2

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:startify_bookmarks = ['~/.vimrc', '~/.gvimrc', '~/.vim/bundle/lanyitin.vim/package.vim']
let g:startify_list_order = ['bookmarks', 'files', 'dir', 'sessions']

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1

let g:neomake_open_list = 1

" auto reload configuration file after save
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc

autocmd! BufWritePost * Neomake
