set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=50

call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

