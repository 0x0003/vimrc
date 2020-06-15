" Vim color scheme
"
" Name:       monochrome.vim
" Maintainer: Xavier Noria <fxn@hashref.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'monochrome'

let s:white  = ['White', 15]
let s:black  = ['#0e1111', 16]
let s:bgray  = ['#181818', 233]
let s:lgray  = ['LightGray', 7]
let s:cgray  = ['#737373', 8]
let s:dgray  = ['DarkGray', 0]
let s:sblue  = ['#778899', 15]
let s:yellow = ['Yellow', 226]
let s:red    = ['#b6403a', 210]
let s:green  = ['#478226', 2]
let s:diffa  = ['#00ff00', 193]
let s:diffr  = ['#ff0000', 174]

let s:default_fg = s:lgray
let s:default_bg = s:black

let s:italic    = 'NONE'
let s:bold      = 'NONE'
let s:underline = 'NONE'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

function! s:hi(...)
  let group = a:1
  let fg    = get(a:, 2, s:default_fg)
  let bg    = get(a:, 3, s:default_bg)
  let attr  = get(a:, 4, s:default_str)

  let cmd = ['hi', group]

  if fg != s:default_lst
    call add(cmd, 'guifg='.fg[0])
    call add(cmd, 'ctermfg='.fg[1])
  endif

  if bg != s:default_lst && bg != s:default_bg
    call add(cmd, 'guibg='.bg[0])
    call add(cmd, 'ctermbg='.bg[1])
  endif

  if attr != s:default_str
    call add(cmd, 'gui='.attr)
    call add(cmd, 'cterm='.attr)
  endif

  exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"
call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:default_lst, s:bgray, s:none)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)
call s:hi('ColorColumn', s:default_fg, s:bgray)
call s:hi('Search', s:dgray, s:green)
call s:hi('Visual', s:cgray, s:white)
call s:hi('ErrorMsg', s:black, s:red)
call s:hi('Error', s:black, s:red)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:sblue, s:default_bg, s:bold)

" File browsers.
call s:hi('Directory', s:white, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:sblue, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:white, s:cgray)
call s:hi('PmenuSel', s:cgray, s:white)

" Notes.
call s:hi('Todo', s:black, s:yellow, s:bold)

" Signs.
call s:hi('SignColumn')

"
" --- Programming languages ----------------------------------------------------
"
call s:hi('Statement', s:white, s:default_bg, s:bold)
call s:hi('PreProc', s:white, s:default_bg, s:bold)
call s:hi('String', s:sblue)
call s:hi('Comment', s:cgray, s:default_bg, s:italic)
call s:hi('Constant')
call s:hi('Type', s:white, s:default_bg, s:bold)
call s:hi('Function', s:white)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:black, s:lgray)


"
" --- VimL ---------------------------------------------------------------------
"
call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment


"
" --- Ruby ---------------------------------------------------------------------
"
call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:sblue)
call s:hi('rubyStringEscape', s:sblue)
call s:hi('rubyRegexpEscape', s:sblue)
call s:hi('rubyRegexpAnchor', s:sblue)
call s:hi('rubyRegexpSpecial', s:sblue)


"
" --- Elixir -------------------------------------------------------------------
"
call s:hi('elixirAlias', s:default_fg, s:default_bg, s:none)
call s:hi('elixirDelimiter', s:sblue)
call s:hi('elixirSelf', s:default_fg, s:default_bg, s:none)

" For ||, ->, etc.
call s:hi('elixirOperator')

" Module attributes like @doc or @type.
hi link elixirVariable Statement

" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String


"
" --- Perl ---------------------------------------------------------------------
"
call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:sblue)
call s:hi('perlStringEscape', s:sblue)
call s:hi('perlMatchStartEnd', s:sblue)


"
" --- Python -------------------------------------------------------------------
"
call s:hi('pythonEscape', s:sblue)


"
" --- JavaScript ---------------------------------------------------------------
"

call s:hi('javaScriptFunction', s:white, s:default_bg, s:bold)


"
" --- Diffs --------------------------------------------------------------------
"
call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:diffa)
call s:hi('diffRemoved', s:diffr)


"
" --- Markdown -----------------------------------------------------------------
"
call s:hi('Title', s:cgray, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:cgray, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:cgray, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sblue, s:default_bg, s:underline)


"
" --- Plugins ------------------------------------------------------------------
"
" IndentGuides
" #121212  terminal bg
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235
"" #1b1b1b terminal bg
" hi IndentGuidesOdd  ctermbg=235
" hi IndentGuidesEven ctermbg=236

" Sneak
hi Sneak      ctermfg=0 ctermbg=2 cterm=NONE
hi SneakLabel ctermfg=0 ctermbg=2 cterm=NONE

