" copy contents of register 1 to any named register
function! copyregister#Cp () abort
  let sourceReg = getreg(1, 1)

  if sourceReg !~# '\v^[a-z0-9]'
    echo "Invalid register given: " . sourceReg
    return
  endif

  let destinationReg = nr2char(getchar())

  if destinationReg !~# '\v^[a-z0-9]'
    echo "Invalid register given: " . destinationReg
    return
  endif

  call setreg(destinationReg, sourceReg)
  echo destinationReg ."=>". sourceReg
endfunction

