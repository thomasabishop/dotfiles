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
"set hidden
set background=dark
set number
set t_Co=256
set laststatus=2
"--- Plugins --- "

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'psliwka/vim-smoothie'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'NLKNguyen/papercolor-theme'
call plug#end() 

syntax on

"--- Mappings --- "

let mapleader = ";"

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"colorscheme greenisgood

    
