" --- Standard Vim settings ---"

set number 
set showmatch 
set ignorecase 
set hlsearch 
set incsearch 
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
"set cc=80
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
" set cursorline 
set ttyfast
set hidden
set t_Co=256

"--- Plugins --- "

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'
call plug#end() 

" --- Airline settings --- " 

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
