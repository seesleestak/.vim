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
set guifont=Monaco:h14

" tabs to spaces
retab

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/L9'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-scripts/FuzzyFinder'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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
execute pathogen#infect()

let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Remappings
map <F10> :set pastetoggle<CR>
noremap ss :update<CR>
map <C-n> ;NERDTreeToggle<CR>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
nmap <S-Enter> O<Esc>
noremap : ;
noremap ; :

" Fuzzy finder mapping
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>
set backspace=indent,eol,start

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

filetype plugin indent on
