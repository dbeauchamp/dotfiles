set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set nu
set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=50
set cursorline
set guicursor=
set termguicolors

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'


Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'tpope/vim-commentary'

Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme gruvbox
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader=' '

lua require('config')

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:netrw_banner = 0
let g:netrw_winsize = 25

if executable('rg')
    let g:rg_derive_root='true'
endif

" easier explore
nnoremap <leader>f :Ex<CR>

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"keybindings for easier switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" system clipboard
xnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

" easily kill the current buffer
nnoremap <leader>k :bd<CR>
nnoremap <leader>K :bd!<CR>

nnoremap <leader>d :vsp %:h/
nnoremap <leader>s  :w<CR>
ino jk <esc>
cno jk <esc>
vno v <esc>

autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
