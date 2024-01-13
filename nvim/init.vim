set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
syntax on
set clipboard=unnamedplus
set cursorline
set ttyfast
set noswapfile
"set wildmode=longest,list
set background=dark
set t_Co=256
set mouse=
set laststatus=2
set termguicolors
set noshowmode 

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'wakatime/vim-wakatime'
Plug 'psliwka/vim-smoothie'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()



colorscheme onedark

let mapleader = ";"
let g:startify_custom_header = 'startify#fortune#boxed(["Hello Thomas"])'

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>tt <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
