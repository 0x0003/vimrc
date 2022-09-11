" `fzy` integration
function! fzy#Command(choice_command, fzy_args, vim_command) abort
  try
    let selection = system(a:choice_command . " | fzy " . a:fzy_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from fzy on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! fzy#Edit() abort
  call fzy#Command("find * -type f", "-l 20", ":e")
endfunction

function! fzy#Buffer(buf_cmd) abort
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  call fzy#Command('echo "' . join(buffers, "\n") . '"', "-l 20", a:buf_cmd)
endfunction

