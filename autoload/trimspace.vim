" remove all trailing whitespaces and preserve screen state
function! trimspace#Trim() abort
  let l:save = winsaveview()
  %s/\s\+$//ge
  call winrestview(l:save)
endfun

