" --- Standard Vim settings ---"

"set number 
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
set background=dark

"--- Plugins --- "

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'psliwka/vim-smoothie'
call plug#end() 

syntax on
"colorscheme greenisgood
