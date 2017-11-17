set so=5
set backspace=indent,eol,start
set mouse=n
set incsearch
set hlsearch

set hidden

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

" Statusline
" ---------------------------------------------
  " Tabline/Buffer line
  " set showtabline=2
  " set tabline="%1T"

  " let g:currentmode={
        " \ 'n'  : 'N ',
        " \ 'no' : 'N·Operator Pending ',
        " \ 'v'  : 'V ',
        " \ 'V'  : 'V·Line ',
        " \ '' : 'V·Block ',
        " \ 's'  : 'Select ',
        " \ 'S'  : 'S·Line ',
        " \ '' : 'S·Block ',
        " \ 'i'  : 'I ',
        " \ 'R'  : 'R ',
        " \ 'Rv' : 'V·Replace ',
        " \ 'c'  : 'Command ',
        " \ 'cv' : 'Vim Ex ',
        " \ 'ce' : 'Ex ',
        " \ 'r'  : 'Prompt ',
        " \ 'rm' : 'More ',
        " \ 'r?' : 'Confirm ',
        " \ '!'  : 'Shell ',
        " \ 't'  : 'Terminal '
        " \}

  " " Automatically change the statusline color depending on mode
  " function! ChangeStatuslineColor()
    " if (mode() =~# '\v(n|no)')
      " exe 'hi! StatusLine ctermfg=008 guifg=#ffffff gui=None cterm=None'
    " elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
      " exe 'hi! StatusLine ctermfg=005 guifg=#00ff00 gui=None cterm=None'
    " elseif (mode() ==# 'i')
      " exe 'hi! StatusLine ctermfg=004 guifg=#6CBCE8 gui=None cterm=None'
    " else
      " exe 'hi! StatusLine ctermfg=006 guifg=orange gui=None cterm=None'
    " endif

    " return ''
  " endfunction

  " " Find out current buffer's size and output it.
  " function! FileSize()
    " let bytes = getfsize(expand('%:p'))
    " if (bytes >= 1024)
      " let kbytes = bytes / 1024
    " endif
    " if (exists('kbytes') && kbytes >= 1000)
      " let mbytes = kbytes / 1000
    " endif

    " if bytes <= 0
      " return '0'
    " endif

    " if (exists('mbytes'))
      " return mbytes . 'MB '
    " elseif (exists('kbytes'))
      " return kbytes . 'KB '
    " else
      " return bytes . 'B '
    " endif
  " endfunction

  " function! ReadOnly()
    " if &readonly || !&modifiable
      " return ''
    " else
      " return ''
  " endfunction

  " function! GitInfo()
    " let git = fugitive#head()
    " if git != ''
      " return ' '.fugitive#head()
    " else
      " return ''
  " endfunction

  " set laststatus=2
  " set statusline=
  " set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
  " set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
  " set statusline+=%8*\ [%n]                                " buffernr
  " set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
  " set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
  " set statusline+=%#warningmsg#
  " set statusline+=%*
  " set statusline+=%9*\ %=                                  " Space
  " set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
  " set statusline+=%0*\ %3p%%\ %l:\ %c\                 " Rownumber/total (%)
" ---------------------------------------------

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
  Plug 'neoclide/vim-jsx-improve'
  " Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'

  " Themes
  Plug 'hzchirs/vim-material'
  Plug 'ayu-theme/ayu-vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'w0ng/vim-hybrid'
  Plug 'mhartington/oceanic-next'
call plug#end()

" Syntax Highlighting
syntax on
if (has("termguicolors"))
  set termguicolors
endif
colorscheme vim-material

" <leader>
let mapleader = ','

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim-jsx
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" NERDCommenter
let g:NERDSpaceDelims = 1

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
  map gf <C-w>gf
  map <leader>r :Rename<space>

  " Buffer related mappings
  nmap <C-l> :bnext<CR>
  nmap <C-h> :bprevious<CR>
  nmap <leader>bq :bp <BAR> bd #<CR>
  nmap <leader>b :b#<CR>

  " fzf mappings
  nmap <leader>t :Files<CR>
  nmap <leader>a :Ag<CR>
  nmap <leader>f :Ag <C-r><C-w><CR>
  nmap <leader>gst :GFiles?<CR>

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
