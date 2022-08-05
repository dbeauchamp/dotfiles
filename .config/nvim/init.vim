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

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

Plug 'tpope/vim-commentary'

Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader=' '

lua require('config')

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files({ hidden = true, ignore = true, find_command = rg })<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

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
