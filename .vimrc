set shell=/bin/bash
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme Monokai
set clipboard=unnamed
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set ruler
set showcmd
set wildmenu
set cursorline

set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

set number
set hlsearch
set ignorecase
set smartcase

set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
set dir=~/.vim/swp
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()


" SHORTCUTS
"
"
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" New tab
nmap <C-n> :tabnew<CR>

set mouse=a
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
