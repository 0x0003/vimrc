" Description: Highlighting is mostly based on dark version of hybrid.vim

" Init
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "tuna"

" Hi
hi Normal          ctermfg=15   ctermbg=NONE cterm=NONE

set background=dark

hi Comment         ctermfg=8    ctermbg=NONE cterm=italic
hi Conceal         ctermfg=15   ctermbg=NONE cterm=NONE
hi Constant        ctermfg=9    ctermbg=NONE cterm=NONE
hi Function        ctermfg=11   ctermbg=NONE cterm=NONE
hi Identifier      ctermfg=13   ctermbg=NONE cterm=NONE
hi PreProc         ctermfg=14   ctermbg=NONE cterm=NONE
hi Special         ctermfg=10   ctermbg=NONE cterm=NONE
hi Statement       ctermfg=12   ctermbg=NONE cterm=NONE
hi String          ctermfg=10   ctermbg=NONE cterm=NONE
hi Todo            ctermfg=233  ctermbg=226  cterm=NONE
hi Type            ctermfg=3    ctermbg=NONE cterm=NONE

hi Error           ctermfg=15   ctermbg=1    cterm=underline
hi Ignore          ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined      ctermfg=12   ctermbg=NONE cterm=NONE

hi LineNr          ctermfg=8    ctermbg=NONE cterm=NONE
hi NonText         ctermfg=8    ctermbg=NONE cterm=NONE

hi Pmenu           ctermfg=15   ctermbg=8    cterm=NONE
hi PmenuSel        ctermfg=15   ctermbg=8    cterm=reverse
hi Wildmenu        ctermfg=8    ctermbg=7    cterm=NONE

hi ErrorMsg        ctermfg=234  ctermbg=9    cterm=standout
hi ModeMsg         ctermfg=10   ctermbg=NONE cterm=NONE
hi MoreMsg         ctermfg=10   ctermbg=NONE cterm=NONE
hi Question        ctermfg=10   ctermbg=NONE cterm=NONE
hi WarningMsg      ctermfg=9    ctermbg=NONE cterm=NONE
hi LongLineWarning ctermfg=NONE ctermbg=NONE cterm=underline

hi TabLine         ctermfg=245  ctermbg=0
hi TabLineFill     ctermfg=234  ctermbg=8
hi TabLineSel      ctermfg=15   ctermbg=236  cterm=NONE

hi CursorColumn    ctermfg=NONE ctermbg=0    cterm=NONE
hi CursorLine      ctermfg=NONE ctermbg=235  cterm=NONE
hi CursorLineNr    ctermfg=7    ctermbg=8    cterm=NONE

hi StatusLine      ctermfg=235  ctermbg=7    cterm=reverse
hi StatusLineNC    ctermfg=234  ctermbg=0    cterm=reverse

hi Visual          ctermfg=NONE ctermbg=8    cterm=NONE

hi FoldColumn      ctermfg=NONE ctermbg=234  cterm=NONE
hi Folded          ctermfg=7    ctermbg=234  cterm=NONE

hi VertSplit       ctermfg=236  ctermbg=NONE cterm=NONE

hi SpecialKey      ctermfg=8    ctermbg=NONE cterm=NONE
hi Title           ctermfg=10   ctermbg=NONE cterm=NONE

hi DiffAdd         ctermfg=193  ctermbg=65   cterm=NONE
hi DiffChange      ctermfg=189  ctermbg=60   cterm=NONE
hi DiffDelete      ctermfg=234  ctermbg=9    cterm=NONE
hi DiffText        ctermfg=234  ctermbg=12   cterm=NONE

hi Search          ctermfg=234  ctermbg=2    cterm=NONE

hi Directory       ctermfg=12   ctermbg=NONE cterm=NONE
hi MatchParen      ctermfg=234  ctermbg=60   cterm=NONE

hi SpellCap        ctermfg=12   ctermbg=17   cterm=underline
hi SpellLocal      ctermfg=14   ctermbg=24   cterm=underline
hi SpellBad        ctermfg=9    ctermbg=52   cterm=underline
hi SpellRare       ctermfg=13   ctermbg=53   cterm=underline

hi ColorColumn     ctermfg=125  ctermbg=NONE cterm=NONE
hi SignColumn      ctermfg=NONE ctermbg=234  cterm=NONE

hi Operator        ctermfg=14   ctermbg=NONE cterm=NONE
hi Structure       ctermfg=14   ctermbg=NONE cterm=NONE
hi qfLineNr        ctermfg=11   ctermbg=NONE cterm=NONE

hi link Boolean                  Constant
hi link Character                Constant
hi link Conditional              Statement
hi link Debug                    Special
hi link Define                   PreProc
hi link Delimiter                Special
hi link Exception                Statement
hi link Float                    Number
hi link HelpCommand              Statement
hi link HelpExample              Statement
hi link Include                  PreProc
hi link Keyword                  Statement
hi link Label                    Statement
hi link Macro                    PreProc
hi link Number                   Constant
hi link Operator                 Statement
hi link PreCondit                PreProc
hi link Repeat                   Statement
hi link SpecialChar              Special
hi link SpecialComment           Special
hi link StorageClass             Type
hi link Structure                Type
hi link Tag                      Special
hi link Typedef                  Type

hi link htmlEndTag               htmlTagName
hi link htmlLink                 Function
hi link htmlSpecialTagName       htmlTagName
hi link htmlTag                  htmlTagName
hi link htmlBold                 Normal
hi link htmlItalic               Normal
hi link xmlTag                   Statement
hi link xmlTagName               Statement
hi link xmlEndTag                Statement

hi link markdownItalic           Preproc
hi link asciidocQuotedEmphasized Preproc

hi link diffBDiffer              WarningMsg
hi link diffCommon               WarningMsg
hi link diffDiffer               WarningMsg
hi link diffIdentical            WarningMsg
hi link diffIsA                  WarningMsg
hi link diffNoEOL                WarningMsg
hi link diffOnly                 WarningMsg
hi link diffRemoved              WarningMsg
hi link diffAdded                Special

" Plugins
" IndentGuides
" " #121212  terminal bg
" hi IndentGuidesOdd  ctermbg=234
" hi IndentGuidesEven ctermbg=235

" #1b1b1b terminal bg
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236

