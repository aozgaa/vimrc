set nocompatible
set nomore
set packpath=/home/fozga/.vim
packloadall
source /home/fozga/.vim/vimrc

function! s:RunCase(name, input, expected) abort
  enew
  setlocal buftype=
  setlocal bufhidden=wipe
  setlocal swapfile&
  call setline(1, a:input)
  setlocal filetype=markdown
  execute "normal! ggVGgq"
  call assert_equal(a:expected, getline(1, '$'), a:name)
  bwipeout!
endfunction

call s:RunCase(
      \ 'plain paragraph splits into one sentence per line',
      \ ['Alpha sentence. Beta sentence. Gamma sentence.'],
      \ ['Alpha sentence.', 'Beta sentence.', 'Gamma sentence.'])

call s:RunCase(
      \ 'bullet prefix is preserved on each sentence line',
      \ ['  - Alpha sentence. Beta sentence.'],
      \ ['  - Alpha sentence.', '    Beta sentence.'])

call s:RunCase(
      \ 'common abbreviations do not force a break',
      \ ['Dr. Smith wrote this. It still breaks after the sentence.'],
      \ ['Dr. Smith wrote this.', 'It still breaks after the sentence.'])

if len(v:errors) > 0
  call writefile(v:errors, '/tmp/sentencer_format.errors')
  cquit 1
endif

quitall!
