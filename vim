set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle start
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'prettier/vim-prettier'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" Vundle end
call vundle#end()             " required
filetype plugin indent on     " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Set core editor settings
set number
set nowrap
set ruler
" set showbreak=+++
" set textwidth=0
" set showmatch
" set visualbell
" set hlsearch
" set smartcase
" set ignorecase
" set incsearch
" set autoindent
" set smartindent
" set smarttab
" set undolevels=1000
" set backspace=indent,eol,start

" Toggle NERDTree
map <C-b> :NERDTreeToggle<CR>
map <C-j> :FZF<CR>

" Set tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Theme settings
syntax enable
colorscheme dracula
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

" Prettier settings
let g:prettier#config#tab_width = 2
let g:prettier#config#single_quote = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.json,*.md,*.vue,*.css,*.scss PrettierAsync
