function! netrwmappings#rebind() abort
  nnoremap <buffer> <silent> <C-l> :call mvsplit#Mv ('l')<CR>
endfunction

