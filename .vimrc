set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle {{{
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" sensible defaults
Plugin 'tpope/vim-sensible'

"" All-inclusive autocomplete plugin
Plugin 'Valloric/YouCompleteMe'

"" Rainbow parentheses for lisp
Plugin 'vim-scripts/vim-niji'

"" Large suite of tools to ease latex editing in vim
"" (on Github)
" Plugin 'vim-latex/vim-latex'
"" (on Sourceforge)
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

"" matching parentheses editing for lisp
" Plugin 'vim-scripts/paredit.vim'

"" A Git Interface
" Plugin 'tpope/vim-fugitive'

"" Matching parentheses but more general
" Plugin 'tpope/vim-surround'

" "" Use <C-h>, <C-j> to navigate across both vim panes and tmux panes
" "" REQUIRES additional config in tmux.conf -- see github page
" Plugin 'christoomey/vim-tmux-navigator'

" "" If vim is running inside tmux, allows easy creation of new shell panes
" Plugin 'benmills/vimux'


" "" Solarized Color Scheme for Vim -- may require additional config
" Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}

" Color scheme {{{
" set background=dark
" " let g:solarized_termcolors=256
" colorscheme solarized
"" }}}

" Gvim Font Settings {{{
" The number sets the font height
set guifont=Monospace\ 16
"" }}}

" General Settings {{{

"" leader key is space
let mapleader = ' '

"" Bash-style tab completion in command mode
set wildmenu
set wildmode=longest,list 
set wildchar=<Tab>

" set omnifunc=syntaxcomplete#Complete

"" how close cursor is to the top/bottom before the screen scrolls
""    (up/down)
set scrolloff=10

"" insert spaces whenever <Tab> is pressed
set expandtab

"" <Tab> inserts spaces according to shiftwidth instead of tabstop
set smarttab

"" witdh of <Tab>
set tabstop=4

"" number of spaces that a <Tab> counts for
""    (ie: normal mode treats spaces like tabs; this determines their width
set softtabstop=4

"" number of spaces used for a step of indentation (ie: <Tab>)
set shiftwidth=4

"" copy current indentation level onto the next line
set autoindent

"" add smart indenting -- see ':help smartindent' for more info
"" (overwritten by 'set cindent' for C-family languages)
set smartindent

"" smart indenting for C-family languages
set cindent

"" can use <BS> over indents, end-of-lines, and past the beginning of an insert
set backspace=indent,eol,start

"" print command at the bottom of the screen
set showcmd

"" print line numbers on the left
set number

"" Show cursor position
set ruler

"" shows the matching parenthesis if it is visible on the screen
set showmatch

"" update seach as you type
set incsearch

"" highlight matches to the search
set hlsearch

"" turn off search highlight
" nnoremap <leader><1> :nohlsearch<CR>

"" ignore capitalization in a search
set ignorecase

"" override ignorecase if the search contains capital letters
set smartcase

"" wrap comments
"" wrap text
"" format comments using gq
"" automatic multi-line comments
"" automatic paragraph indenting
set formatoptions=c,t,q,r

"" doesn't save swap files
set noswapfile

"" width of line before it is auto-wrapped
set textwidth=80

"" automatically re-read the file if it changed outside the buffer
" set autoread

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" set showmode

"" set history
set viminfo='20,<2000,s10,h
"" }}}

"" FOLDING {{{
set foldmethod=marker
"" Defines marker-based folds on buffer load, then uses syntax folding during
"" the editing.
"" TODO: update marker-based folds on save, use syntax folding while editing.
"" TODO: need to figure out how to add in the marker-folds to the syntax folds.
"" ALTERNATE IDEA: generate marker and syntax folds on save, load them into a
"" manual fold editing session.
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=marker
"   au BufWinEnter * if &fdm == 'marker' | setlocal foldmethod=manual | endif
" augroup END

"" }}}

" Language Specific Settings {{{

"" send file contents to next pane in tmux
"" (using for sending text between vim and a scheme repl)
map ,t :w \| !tmux loadb % && tmux pasteb -t 1

augroup languages
    
    autocmd!

    " Haskell indentation
    autocmd FileType haskell setl sw=2 ts=2 sts=2 et
    
    " Makefile indentation
    autocmd FileType make set ts=2
augroup END
"" }}}

" Latex-Suite {{{
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"" default output type of compilation
let g:Tex_DefaultTargetFormat='pdf'
"" }}}

" YouCompleteMe Settings {{{
" address of YouCompleteMe conf
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" }}}

