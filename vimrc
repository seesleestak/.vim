set so=6
set backspace=indent,eol,start
set mouse=n
set incsearch
set wildmenu

" Fixing ESC delay
set timeoutlen=1000
set ttimeoutlen=0

" Line numbers
set number
set relativenumber

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
retab

" Don't backup
set nobackup
set noswapfile

" System clipboard
set clipboard=unnamed

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" vim-plug
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'danro/rename.vim'
  Plug 'SirVer/ultisnips'
  Plug 'haya14busa/incsearch.vim'
  Plug 'wakatime/vim-wakatime'

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
  Plug 'hzchirs/vim-material'
  Plug 'dunckr/vim-monokai-soda'
  Plug 'baines/vim-colorscheme-thaumaturge'
  Plug 'ayu-theme/ayu-vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'mhartington/oceanic-next'
call plug#end()

" Syntax Highlighting
syntax on
if (has("termguicolors"))
  set termguicolors
endif
colorscheme ayu

let mapleader = ','
let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" NERDTree config
let g:NERDSpaceDelims = 1
let g:NERDTreeQuitOnOpen = 1

" UltiSnips config
let g:UltiSnipsJumpForwardTrigger = '<c-i>'
let g:UltiSnipsJumpBackwardTrigger = '<c-o>'
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" Ale config
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
  \ 'eslint'
  \]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" CtrlP config
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|coverage\|lib\|log\|tmp$',
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
  map gf <C-w>gf
  map <leader>q :q<CR>
  map <leader>r :Rename<space>
  noremap <leader>s :update<CR>
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
