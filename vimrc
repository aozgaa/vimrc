set nocompatible
filetype plugin on
syntax on

colorscheme pablo

runtime macros/matchit.vim
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set hlsearch " highlight search results

" tab settings
set tabstop=4
set shiftwidth=4
set smarttab " Autotabs for certain code
set expandtab " insert spaces instead of tab character

" indent-based folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevelstart=10

" use PRIMARY (select) clipboard
set clipboard=unnamedplus

"" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
	autocmd!
	" automatically update links on read diary
	autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

"" vimtex
let g:tex_flavor = 'latex'

"" clang-format.py
" if has('python3')
"   map <C-I> :py3f /usr/share/clang/clang-format.py<cr>
"   imap <C-I> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
" endif

" if filereadable("/usr/share/clang/clang-format.py")
"     function! Clangformatonsave()
"         let l:formatdiff = 1
"         py3f /usr/share/clang/clang-format.py
"     endfunction
"     autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Clangformatonsave()
" endif

"" k autorun
:au bufread,bufnewfile *.k
  \ :nnoremap <leader><leader>
  \ :w<CR>:exec '!~/k9/k' shellescape(@%, 1)<CR>

"" format verilog files on save
:au bufwrite *.v,*.vh,*.sv,*.svh call FormatVerilog()
function! FormatVerilog()
    let l:winview = winsaveview()
    :%!iStyle
    call winrestview(l:winview)
endfunction
