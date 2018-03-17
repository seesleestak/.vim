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
set timeoutlen=1000 ttimeoutlen=0

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


" vim-plug ---------------------------------------
call plug#begin('~/.vim/plugged')
  " Core editor functionality
  Plug 'SirVer/ultisnips'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-buftabline'
  Plug 'haya14busa/is.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'xtal8/traces.vim'
  Plug 'styled-components/vim-styled-components'

  " File management/navigation
  Plug 'justinmk/vim-dirvish'
  Plug '/usr/local/opt/fzf' " Assumes fzf installed with homebrew
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " JS
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'

  " Themes
  Plug 'arcticicestudio/nord-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'w0ng/vim-hybrid'
call plug#end()
" ------------------------------------------------


" Syntax Highlighting
syntax on
if (has("termguicolors"))
  set termguicolors
endif
colorscheme hybrid

" Create Rg command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Plugin config ----------------------------------
  " Closetag
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

  " UltiSnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

  " vim-javascript
  let g:javascript_conceal = 0
  
  " dirvish config
  let g:dirvish_mode = 2
  let g:dirvish_relative_paths = 1

  " Ale
  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['eslint']
  let g:ale_fix_on_save = 1
  " let g:ale_javascript_prettier_options = '--single-quote --trailing-comma --no-semi --arrow-parens always --printWidth 120'
" ------------------------------------------------


" Remappings -------------------------------------
  " <leader>
  let mapleader = ','

  nnoremap <leader>s :update<CR>
  nnoremap <leader>q :q<CR>

  " Get file path of current buffer
  nnoremap <leader>p :let @*=expand("%:p")<CR>
  
  " View and source vimrc
  nnoremap <leader>v :e $MYVIMRC<CR>
  nnoremap <leader>r :so $MYVIMRC<CR>

  " commentary mapping
  noremap <leader>c :Commentary<CR>

  " Disable ex mode
  nnoremap Q <Nop>

  " Buffer related mappings
  nnoremap <C-l> :bnext<CR>
  nnoremap <C-h> :bprevious<CR>
  nnoremap <leader>bq :bp <BAR> bd #<CR>

  " fzf mappings
  nnoremap <leader>t :Files<CR>
  nnoremap <leader>a :Rg<space>
  nnoremap <leader>f :Rg <C-r><C-w><CR>
  nnoremap <leader>gst :GFiles?<CR>

  nnoremap <leader>lg :call EasyConsoleLog()<CR>
" ------------------------------------------------


" Statusline -------------------------------------
  " Modified from https://github.com/ahmedelgabri/dotfiles/blob/c4f40c27b295ecfb7673bd29d373cab26b93379b/vim/vimrc.local#L302-L423

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

  function! GitInfo()
    let git = fugitive#head()
    if git != ''
      return fugitive#head()
    else
      return ''
  endfunction

  set laststatus=2
  set statusline=
  set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
  set statusline+=%8*\ %<%F\ %m\ %w\                       " File+path
  set statusline+=%#warningmsg#
  set statusline+=%*
  set statusline+=%9*\ %=                                  " Space
  set statusline+=%{LinterStatus()}\                       " Lint errors
  set statusline+=%3p%%\ %l,%c\                            " total (%)/Row: Col
" ------------------------------------------------


" Billy's console log creator
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." --- ', ".word.")"
endfunction

filetype plugin indent on
