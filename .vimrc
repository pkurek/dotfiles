" NeoBundle init start
if has('vim_starting')
   if &compatible
     set nocompatible
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'vim-scripts/textobj-rubyblock'
NeoBundle 'vim-scripts/textobj-user'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'flazz/vim-colorschemes'

" NeoBundle init end
" Bundle ''
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Set shell
set shell=/bin/bash

" Remap esc key
inoremap jj <ESC>
" Remap leader key
let mapleader = "\<Space>"

"alias unnamed register to the + register, which is the X Window clipboard.
"set clipboard=unnamedplus
set clipboard=unnamed

"turn on syntax highlighting
syntax on
set synmaxcol=200
syntax sync minlines=256

" set colorscheme
colorscheme Monokai

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set ruler
set showcmd
set wildmenu
set cursorline

set backup
set backupdir=~/.vim/backup
set swapfile
set dir=~/.vim/swp

" keep file undo history
set undofile
set undodir=~/.vim/undo
set undolevels=100

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

set number
set hlsearch
set ignorecase
set smartcase
set mouse=a

set dir=~/.vim/swp

set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Ident guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235

" SHORTCUTS
"
"
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
" New tab
nmap <C-n> :tabnew<CR>


nnoremap <leader>m o <esc>
nnoremap <leader>M O <esc>
nnoremap <leader>c :tabclose <cr>
map <leader>s :NERDTreeFind<cr>
 
" this should automatically change buffer on external modifications
autocmd BufEnter,CursorHold,CursorHoldI * silent! :checktime
"remove trailing whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e


" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    let g:ctrlp_use_caching = 0
endif

" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" enable matchit
runtime macros/matchit.vim
