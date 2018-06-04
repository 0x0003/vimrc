" move between splits or create them if there are none
function! mvsplit#Mv (key) abort
  let t:cursplit = winnr()
  exec "wincmd ".a:key
  if (t:cursplit == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

