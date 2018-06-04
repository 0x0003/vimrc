" mark split for swapping
function! swpsplit#Mark() abort
  let g:markedWinNum = winnr()
  " turn off highlighting as a visual representation of marked split
  let g:curft = &filetype
  setlocal ft=
endfunction

" swap split
function! swpsplit#Swap() abort
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
  " turn highlighting back on
  let &filetype=g:curft
endfunction

