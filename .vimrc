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
  Plug 'mileszs/ack.vim'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'danro/rename.vim'
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
let mapleader = ","
let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1

" CtrlP config
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'src'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|coverage\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" Remappings
map <F10> :set pastetoggle<CR>
map <leader>q :q<CR>
noremap zz :update<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
noremap <leader>f :Ack<space>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
nmap <S-Enter> O<Esc>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Conditionally allow backspace
set backspace=indent,eol,start

filetype plugin indent on
