set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'autozimu/LanguageClient-neovim'

call vundle#end()

filetype plugin indent on

let mapleader = "\<Space>"
syntax on
color dracula
au CursorHold * checktime

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd', '-background-index'],
  \ }

let g:LanguageClient_diagnosticsEnable=0

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#fnamemod=':p:t'
let g:airline#extensions#tabline#fnametruncate=0
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline#extensions#ycm#enabled =1
let g:airline#extensions#ycm#error_symbol = '✖ '
let g:airline#extensions#ycm#warning_symbol = '⚠ '

let g:ycm_clangd_uses_ycmd_caching=0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_server_python_interpreter="/usr/bin/python2"
let g:ycm_warning_symbol = '⚠'
let g:ycm_error_symbol = '✖'

let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:bufferline_echo = 0

let c_no_curly_error = 1

let g:gitgutter_max_signs = 500

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](googletest-download|googletest-src|googletest-build|CMakeFiles|bin|lib)$',
  \ 'file': '\v(exe|so|dll|o|marks|gcno|pyc|a|out|make|internal|includecache|Makefile|CMakeCache.txt|pc|CMakeDoxyfile.in)$',
  \ }

function! Formatonsave()
    let l:formatdiff="all"
    py3f /usr/local/share/clang/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call Formatonsave()

set encoding=utf-8
set fileencoding=utf-8
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set cinoptions=(4,W4)
set pastetoggle=<F2>
set laststatus=2
set hidden
set fileformats=unix
set autowrite
set autoread
set nobackup
set noswapfile
set nowritebackup
set t_Co=256
set updatetime=100
set backspace=indent,eol,start
set clipboard=unnamedplus
set colorcolumn=100
set completeopt=longest,menuone
set cursorline
set diffopt+=vertical
set exrc secure
set foldenable
set foldlevelstart=10
set foldnestmax=10
set gdefault
set history=8192
set incsearch
set hlsearch
set lazyredraw
set list
set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:⎵
set modelines=1
set noautochdir
set noerrorbells
set nospell
set nostartofline
set nowrap
set number
set relativenumber
set ruler
set scrolloff=8 sidescrolloff=15 sidescroll=1
set shortmess=I
set showcmd
set showmatch
set showmode
set smartcase
set splitright
set tags=./.tags;,.tags;./.git/.tags;,.git/.tags;
set textwidth=0 wrapmargin=0
set title
set ttimeout
set ttimeoutlen=1
set ttyfast
set wildmenu
set wildmode=list:longest,list:full
set undofile
set undodir=$HOME/.vim/undo

nnoremap ; :
vnoremap ; :

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :wq!<CR>

inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
