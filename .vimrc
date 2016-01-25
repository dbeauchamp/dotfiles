" Vim basics
" ~~~~~~~~~~
set nocompatible
set encoding=utf-8
set t_Co=256

" Enable vim-plug
" ===============
call plug#begin()

" Plugins
" =======

" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bruno-/vim-husk'

" System
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'
Plug 'blueyed/vim-diminactive'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Plain Text
Plug 'reedes/vim-pencil', {'for': ['text']}
Plug 'junegunn/goyo.vim', {'for': ['text']}
Plug 'amix/vim-zenroom2', {'for': ['text']}

" Syntaxes
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'kchmck/vim-coffee-script', {'for': ['coffee']}
Plug 'toadums/vim-cjsx', {'for': ['coffee']}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'haml']}
Plug 'mxw/vim-jsx', {'for': ['javascript']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss', 'sass', 'haml']}
Plug 'digitaltoad/vim-jade'

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" Themes
Plug 'flazz/vim-colorschemes'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'

" End vim-plug
" ============

call plug#end()

" Display Settings
" ================
syntax enable

if has('nvim')
  nmap <bs> <c-w>h
endif

" Disable netrw
let g:loaded_netrw       = 1
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
let g:diminactive_enable_focus = 1

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

set noesckeys
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
nmap gV `[v`]

" Visual find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Remove whitespace
map <Leader>W :%s/\s\+$//e<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Clear last search
nnoremap <space> :set hlsearch! hlsearch?<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Add some other bindings from files to languages
autocmd! BufRead,BufNewFile *.jbuilder,Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile */nginx/*.conf set filetype=nginx
au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.jeco setf html
au BufRead,BufNewFile *.jss set filetype=css
au BufRead,BufNewFile *.hbs set filetype=mustache
au BufRead,BufNewFile *.md set filetype=markdown
autocmd! BufWritePost,BufEnter * Neomake

" linters
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['eslint']

" Colorscheme
" ===========
let g:hybrid_use_Xresources = 1
let base16colorspace=256
silent! colorscheme Tomorrow-Night
set background=dark

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
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP
  let g:ctrlp_use_caching = 0 " Ag is fast enough that CtrlP doesn't need cache
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

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

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h

" easily kill the current buffer
nnoremap <leader>k  :Bdelete<CR>
nnoremap <leader>K  :bd<CR>
nnoremap <leader>d :vsp %:h/
nnoremap <leader>` :NERDTreeFind<CR>

