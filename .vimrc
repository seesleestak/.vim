set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set laststatus=2
set autoindent
set pastetoggle=<F10>
set nu
set relativenumber
syntax on
" colorscheme itg_flat
 map <F10> :set pastetoggle<CR>
 set runtimepath^=~/.vim/bundle/ctrlp.vim
 let g:jsx_ext_required = 0
 let g:ctrlp_working_path_mode = 'ca'
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
   \ }
 execute pathogen#infect()
 map <C-n> ;NERDTreeToggle<CR>

 " Use CTRL-S for saving, also in Insert mode
  noremap zz :update<CR>
 noremap <c-j> <c-w>j
 noremap <c-k> <c-w>k
 noremap <c-l> <c-w>l
 noremap <c-h> <c-w>h
 nmap <S-Enter> O<Esc>
 noremap : ;
 noremap ; :
 set backspace=indent,eol,start
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0

 filetype plugin indent on
