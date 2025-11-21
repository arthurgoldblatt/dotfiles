" Basic sane defaults
set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on

" Leader and UI
let mapleader = " "
set number relativenumber
set cursorline
set signcolumn=yes
set scrolloff=4
set showcmd
set laststatus=2
set termguicolors
set background=dark

" Editing
set hidden
set wrap
set linebreak
set breakindent
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set smartcase
set ignorecase
set hlsearch
set incsearch
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,noselect
set clipboard=unnamedplus
set mouse=a
set updatetime=300
set timeoutlen=500
set splitbelow
set splitright

" Use ripgrep for :grep if available
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Persistent undo (private dir)
if has("persistent_undo")
  if empty(glob("~/.vim/undo"))
    call mkdir("~/.vim/undo", "p", 0700)
  endif
  set undodir=~/.vim/undo
  set undofile
endif

" Mappings
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap Y y$
xnoremap <leader>p "_dP

" Plugins (via vim-plug if installed)
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin("~/.vim/plugged")
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  call plug#end()
endif

" Light statusline without a plugin
set statusline=%f%m%r%h%w\ [%{&filetype}]\ %=%-14.(%l,%c%V%)\ %P
