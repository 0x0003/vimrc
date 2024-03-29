" create session
function! sessions#Make() abort
  let b:sessiondir = $HOME . "/.vim/.backup/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' . shellescape(b:sessiondir, 1)
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

" load session
function! sessions#Load() abort
  let b:sessiondir = $HOME . "/.vim/.backup/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

