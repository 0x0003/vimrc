" netrw overwrites set mappings in its window - set them back
function! netrwmappings#Rebind() abort
  nnoremap <buffer> <silent> <C-l> :call mvsplit#Mv ('l')<CR>
endfunction

