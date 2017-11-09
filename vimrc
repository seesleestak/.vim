set so=5
set backspace=indent,eol,start
set mouse=n
set incsearch
set hlsearch

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
" autocmd BufWritePre * %s/\s\+$//e

" vim-plug
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'vim-airline/vim-airline'
  Plug 'danro/rename.vim'
  Plug 'SirVer/ultisnips'
  Plug 'haya14busa/is.vim'
  Plug 'wakatime/vim-wakatime'

  " File management
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

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
  Plug 'ayu-theme/ayu-vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'whatyouhide/vim-gotham'
  Plug 'w0ng/vim-hybrid'
  Plug 'cocopon/iceberg.vim'
  Plug 'jordwalke/flatlandia'
  Plug 'cdmedia/itg_flat_vim'
  Plug 'mhartington/oceanic-next'
call plug#end()

" Syntax Highlighting
syntax on
if (has("termguicolors"))
  set termguicolors
endif
colorscheme vim-material

let mapleader = ','

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim-jsx
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" NERDTree
let g:NERDSpaceDelims = 1
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" UltiSnips
let g:UltiSnipsJumpForwardTrigger = '<c-i>'
let g:UltiSnipsJumpBackwardTrigger = '<c-o>'
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" Ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
  \ 'eslint'
  \]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" Billy's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." --- ', ".word.")"
endfunction

" Remappings
" ----------------------------
  noremap <leader>s :update<CR>
  map <leader>q :q<CR>
  map  <C-l> :tabn<CR>
  map  <C-h> :tabp<CR>
  map gf <C-w>gf
  map <leader>r :Rename<space>
  nmap <leader>b :b#<CR>

  " fzf mappings
  nmap <leader>t :Files<CR>
  nmap <leader>a :Ag<CR>
  nmap <leader>f :Ag <C-r><C-w><CR>
  nmap <leader>gst :GFiles?<CR>
  nmap <leader>l :Lines<CR>

  " Disable ex mode
  map Q <Nop>

  " Fugitive mappings
  map <leader>gb :Gblame<CR>
  map <leader>gd :Gdiff<CR>

  " NERDTree mappings
  map <C-n> :NERDTreeToggle<CR>
  nmap <leader>n :NERDTreeFind<CR>

  nnoremap <leader>lg :call EasyConsoleLog()<CR>

  " Completion pop up menu mappings
  inoremap <C-j> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-j>"<CR>
  inoremap <C-k> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-k>"<CR>
" ----------------------------

filetype plugin indent on
