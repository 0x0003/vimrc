" execute macro over visual selection on lines that match
function! visualmacro#At() abort
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

