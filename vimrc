" Allow backspace
set backspace=indent,eol,start

" Allow scrolling
set mouse=n

" Search highlighting
set incsearch
set hlsearch

" Hide buffers instead of closing
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

" Don't backup
set nobackup
set noswapfile

" System clipboard
set clipboard=unnamed

" Only redraw once macro is done running
set lazyredraw

" vim-plug
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'SirVer/ultisnips'
  Plug 'haya14busa/is.vim'
  Plug 'ap/vim-buftabline'
  Plug 'wakatime/vim-wakatime'
  Plug 'scrooloose/nerdcommenter'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'xtal8/traces.vim'

  " File management/navigation
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " JS syntax
  Plug 'neoclide/vim-jsx-improve'
  Plug 'w0rp/ale'
  Plug 'galooshi/vim-import-js'

  " Themes
  Plug 'seesleestak/oceanic-next'
  Plug 'ayu-theme/ayu-vim'
  " Plug 'arcticicestudio/nord-vim'
  " Plug 'tyrannicaltoucan/vim-quantum'
  " Plug 'rainglow/vim'
call plug#end()

" Syntax Highlighting
syntax on
if (has("termguicolors"))
  set termguicolors
endif
let ayucolor = 'mirage'
colorscheme ayu

" <leader>
let mapleader = ','

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

  " NERDTree
  let g:NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1

  " NERDCommenter
  let g:NERDSpaceDelims = 1

  " vim-markdown-previewer
  let vim_markdown_preview_browser = 'Google Chrome'
  let vim_markdown_preview_github = 1 " use github flavored markdown
  let vim_markdown_preview_temp_file = 1 " delete tmp file when done
  let vim_markdown_preview_toggle = 2 " update preview on file write

  " UltiSnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

  " Ale
  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = [
    \ 'eslint'
    \]
  let g:ale_fix_on_save = 1
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi --print-width 120'
" ------------------------------------------------

" Remappings -------------------------------------
  nnoremap <leader>s :update<CR>
  nnoremap <leader>q :q<CR>
  nmap <leader>p :let @*=expand("%:p")<CR>

  " Disable ex mode
  map Q <Nop>

  " Buffer related mappings
  nmap <C-l> :bnext<CR>
  nmap <C-h> :bprevious<CR>
  nmap <leader>bq :bp <BAR> bd #<CR>

  " NERDTree mappings
  nnoremap <C-n> :NERDTreeToggle<CR>
  nmap <leader>n :NERDTreeFind<CR>

  " fzf mappings
  nmap <leader>t :Files<CR>
  nmap <leader>a :Ag<CR>
  nmap <leader>gst :GFiles?<CR>

  " Fugitive mappings
  nnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>gd :Gdiff<CR>

  " Completion pop up menu mappings
  inoremap <C-j> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-j>"<CR>
  inoremap <C-k> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-k>"<CR>

  nnoremap <leader>lg :call EasyConsoleLog()<CR>
" ------------------------------------------------

" Statusline -------------------------------------
" Modified from https://github.com/ahmedelgabri/dotfiles/blob/c4f40c27b295ecfb7673bd29d373cab26b93379b/vim/vimrc.local#L302-L423
  let g:currentmode={
        \ 'n'  : 'N ',
        \ 'no' : 'N·Operator Pending ',
        \ 'v'  : 'V ',
        \ 'V'  : 'V·Line ',
        \ '' : 'V·Block ',
        \ 's'  : 'Select ',
        \ 'S'  : 'S·Line ',
        \ '' : 'S·Block ',
        \ 'i'  : 'I ',
        \ 'R'  : 'R ',
        \ 'Rv' : 'V·Replace ',
        \ 'c'  : 'Command ',
        \ 'cv' : 'Vim Ex ',
        \ 'ce' : 'Ex ',
        \ 'r'  : 'Prompt ',
        \ 'rm' : 'More ',
        \ 'r?' : 'Confirm ',
        \ '!'  : 'Shell ',
        \ 't'  : 'Terminal '
        \}

  " Get ale lint errors
  function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
  endfunction

  " Find out current buffer's size and output it.
  function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
      let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
      let mbytes = kbytes / 1000
    endif

    if bytes <= 0
      return '0'
    endif

    if (exists('mbytes'))
      return mbytes . 'MB '
    elseif (exists('kbytes'))
      return kbytes . 'KB '
    else
      return bytes . 'B '
    endif
  endfunction

  function! ReadOnly()
    if &readonly || !&modifiable
      return ''
    else
      return ''
  endfunction

  function! GitInfo()
    let git = fugitive#head()
    if git != ''
      return ' '.fugitive#head()
    else
      return ''
  endfunction

  set laststatus=2
  set statusline=
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
  set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
  set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
  set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
  set statusline+=%#warningmsg#
  set statusline+=%*
  set statusline+=%9*\ %=                                  " Space
  set statusline+=%{LinterStatus()}\                       " Lint errors
  set statusline+=%0*\ %L\ %3p%%\ %l:\ %c\                 " Rownumber/total (%)
" ------------------------------------------------

" Billy's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." --- ', ".word.")"
endfunction

filetype plugin indent on
