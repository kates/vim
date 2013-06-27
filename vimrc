
execute pathogen#infect()

set nocompatible
set encoding=utf8
set colorcolumn=81

let mapleader = ","
imap jj <Esc>

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()

" Indenting *******************************************************************
set ai 
set si 
set pastetoggle=<F2>

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline
set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Colors **********************************************************************
set background=dark 
syntax on
colorscheme ir_dark


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


" Line Wrapping ***************************************************************
set wrap
set linebreak  " Wrap at word


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=~/Documents/vim

" Set Swap directory
set directory=~/Documents/vim/swap

filetype plugin indent on

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable " Turn off folding 


" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

map <Leader>p <C-^> " Go back to previous file

" NERDTree ********************************************************************
noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything
let NERDTreeDirArrows=0


" NERD Commenter *********************************************************
let NERDCreateDefaultMappings=0
map <Leader>c :call NERDComment(0, "toggle")<CR> 

" CtrlP ******************************************************************
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <Leader>f :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" railsvim ***************************************************************
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>


" ctags ******************************************************************
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window=1
map <Leader>t :TlistToggle<cr>

" Ag aka the_silver_searcher *********************************************
map <Leader>a <Esc>:Ag 

" File save/quit
map <Leader>w :w<CR>
map <Leader>z :q<CR>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set undodir=~/.vim/backup
