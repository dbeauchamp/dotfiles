" Vim basics
" ==========
set nocompatible
set encoding=utf-8

" Enable vim-plug
" ===============
call plug#begin('~/.vim/plugged')

" Plugins
" =======

" VCS
Plug 'tpope/vim-fugitive'

" System
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'blueyed/vim-diminactive'
" Plug 'roman/golden-ratio'

" Plain Text
Plug 'reedes/vim-pencil', {'for': ['text']}
Plug 'junegunn/goyo.vim', {'for': ['text']}
Plug 'amix/vim-zenroom2', {'for': ['text']}

" Syntaxes
Plug 'alvan/vim-closetag'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}

" Golang
Plug 'fatih/vim-go'

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-emoji'
Plug 'chriskempson/base16-vim'

" Colors
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'

" End vim-plug
" ============
call plug#end()

" Display Settings
" ================
syntax enable
set background=dark

" Color Scheme
" let g:seoul256_background = 235
" color seoul256
colorscheme base16-default-dark

" let g:seoul256_light_background = 256
" color seoul256-light

highlight link xmlEndTag xmlTag

if has('nvim')
  nmap <bs> <c-w>h
endif

" Disable netrw
let g:loaded_netrw= 1
let g:loaded_netrwPlugin = 1

" General Config
" ==============
let mapleader=' '
set number                      " Line numbers are good
set relativenumber
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set clipboard=unnamed           " Use system clipboard
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set re=1                        " Uses the first regex version, major speedup
let g:jsx_ext_required = 0      " Allow JSX in normal JS file
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Mouse
" ======
set mouse=a " Enable mouse use in all modes

" Search Settings
" ===============
set incsearch        " Find the next match as we type the search
set hlsearch         " Hilight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Indentation and Display
" =======================
filetype plugin on
filetype indent on
set autoindent
set copyindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set colorcolumn=                    " Don't show a marker
set nowrap                            " Don't wrap lines
set linebreak                         " Wrap lines at convenient points
set cursorline
set ttyfast

"Go
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Folds
" =====
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl,*.sw?,*.DS_Store,*.luac,*.pyc,**.class
set wildignore+=bower_components,node_modules,vendor/bundle,public

" Scrolling
" =========
" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Disable Arrow Keys
" ==================
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>
imap <up>    <nop>
map  <down>  <nop>
map  <left>  <nop>
map  <right> <nop>
map  <up>    <nop>

set ttimeout
set ttimeoutlen=1

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h

" Selection
" ==========
"
" select all
map <Leader>a ggVG

" Yank from cursor to end of line
nnoremap Y y$

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap V `[v`]

" Visual find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Remove whitespace
map <Leader>W :%s/\s\+$//e<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Clear last search
nnoremap <space> :set hlsearch! hlsearch?<CR>

" Add some other bindings from files to languages
autocmd! BufRead,BufNewFile *.jbuilder,Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile */nginx/*.conf set filetype=nginx
au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.md set filetype=markdown

" linters
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" Airline
" =======
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#enable#branch = 1

" Git Gutter
" ==========
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0

" Searching
" ==========
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,max:40'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_user_command = 'ag %s -l -g ""'
let g:ctrlp_custom_ignore = 'node_modules\|DS_store'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP
  let g:ctrlp_use_caching = 0 " Ag is fast enough that CtrlP doesn't need cache
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" UltiSnips
" =========
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Don't let nerdtree open by default when opening a folder.
let g:NERDTreeHijackNetrw=0
let g:NERDTreeShowHidden=1

" Keybindings
" ==========
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>s  :w<CR>
ino jk <esc>
cno jk <esc>
vno v <esc>

"keybindings for easier switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" easily kill the current buffer
nnoremap <leader>k :bd<CR>
nnoremap <leader>K :bd!<CR>
nnoremap <leader>d :vsp %:h/

