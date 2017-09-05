set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set laststatus=2
set autoindent
set wildmenu
set pastetoggle=<F10>
set nu
set relativenumber

" tabs to spaces
retab

" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'airblade/vim-gitgutter'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-surround'
  Plug 'severin-lemaignan/vim-minimap'

  " theme
  Plug 'hzchirs/vim-material'
  Plug 'dunckr/vim-monokai-soda'
  Plug 'baines/vim-colorscheme-thaumaturge'
  Plug 'nightsense/seabird'
  Plug 'ayu-theme/ayu-vim'
call plug#end()

syntax on
set termguicolors
colorscheme vim-material
let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_cmd = 'CtrlP /src' " set default ctrlp directory as src
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Remappings
map <F10> :set pastetoggle<CR>
noremap zz :update<CR>
map <C-n> ;NERDTreeToggle<CR>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
nmap <S-Enter> O<Esc>
noremap : ;
noremap ; :

" Conditionally allow backspace
set backspace=indent,eol,start

filetype plugin indent on
