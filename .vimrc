set tabstop=2
set autoread
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
set backspace=indent,eol,start
set mouse=n

" System clipboard
set clipboard=unnamed

" Tabs to spaces
retab

" vim-plug
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'tpope/vim-surround'
  Plug 'Townk/vim-autoclose'
  Plug 'vim-scripts/closetag.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'danro/rename.vim'
  Plug 'SirVer/ultisnips'
  Plug 'Valloric/MatchTagAlways'
  " Plug 'Valloric/YouCompleteMe'
 
  " File management
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'

  " Git
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " JS syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'

  " Themes
  Plug 'encody/nvim'
  Plug 'hzchirs/vim-material'
  Plug 'dunckr/vim-monokai-soda'
  Plug 'baines/vim-colorscheme-thaumaturge'
  Plug 'nightsense/seabird'
  Plug 'ayu-theme/ayu-vim'
call plug#end()

" Syntax Highlighting
syntax on
set termguicolors
colorscheme ayu

let mapleader = ','
let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1
let g:NERDSpaceDelims = 1

let g:UltiSnipsJumpForwardTrigger='<c-i>'
let g:UltiSnipsJumpBackwardTrigger='<c-o>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']

" CtrlP config
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|coverage\|lib\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists('g:loaded_ctrlp') && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has('autocmd')
  autocmd VimEnter * :call SetupCtrlP()
endif

" Remappings
" ----------------------------
  map <F10> :set pastetoggle<CR>
  map <leader>q :q<CR>
  map <leader>r :Rename<space>
  noremap <leader>s :update<CR>
  noremap <c-j> <c-w>j
  noremap <c-k> <c-w>k
  noremap <c-l> <c-w>l
  noremap <c-h> <c-w>h
  map  <C-l> :tabn<CR>
  map  <C-h> :tabp<CR>

  " Fugitive mappings
  map <leader>gb :Gblame<CR>
  map <leader>gd :Gdiff<CR>

  " NERDTree mappings
  map <C-n> :NERDTreeToggle<CR>
  nmap <leader>n :NERDTreeFind<CR>

  noremap <leader>f :Ack!<space>
" ----------------------------

filetype plugin indent on
