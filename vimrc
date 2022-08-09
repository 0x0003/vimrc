filetype plugin indent on

"" PLUGINS
" # Completor
let g:completor_completion_delay = 1 " milliseconds

" # UltiSnips
let g:UltiSnipsEditSplit = "vertical"
" mappings
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" runtimepath lookup
let g:UltiSnipsSnippetDirectories = ["snip", "UltiSnips"]
" personal snippets dir
let g:UltiSnipsSnippetsDir = "$HOME/.vim/snip"

" # IndentGuides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_tab_guides = 0
let g:indent_guides_default_mapping = 0

" # ALE
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 0
let g:ale_open_list = "on_save"

" # Pear-tree
let g:pear_tree_repeatable_expand = 0

" # commentary.vim
augroup commentary
  autocmd!
  autocmd FileType autohotkey setlocal commentstring=;\ %s
augroup END

" # netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = &wildignore

augroup netrw_mappings
  autocmd!
  autocmd filetype netrw call netrwmappings#rebind()
augroup END

"" GENERAL
syntax on
colorscheme tuna-rev

set novisualbell
set langnoremap
set autoindent
set encoding=utf-8
set autoread
set scrolloff=5 sidescrolloff=5
set splitbelow splitright
set lazyredraw
set hidden                      " jump between buffers w/o writing them
set tabline=%!tabline#Tabline() " apply custom tabline
set backspace=indent,eol,start  " backspace over everything
set history=100                 " command line history
set sessionoptions-=options     " don't store global & local vars in a session
set sessionoptions-=folds       " don't store folds in a session
set mouse=a                     " enable mouse
set laststatus=1                " don't show statusline with only 1 window
set title                       " set window title as open file
set ttimeoutlen=0               " fast keys
set nrformats=                  " increment and subtract in decimal
set shortmess+=I                " don't show intro message
set shortmess+=F                " don't give the file info when editing a file
set shortmess+=O                " msg for reading file overwrites any prev msg
set shortmess-=S                " show count of matches when searching
set showcmd                     " show nm keypresses/size of the selected area
set colorcolumn=80
set ruler
set cursorline

" search format
set ignorecase smartcase
set incsearch hlsearch

" undo, swap, backups and viminfo
set undofile
set undodir=$HOME/.vim/.backup/undofiles
set noswapfile
set backup
set backupdir=$HOME/.vim/.backup
augroup vimbak
  autocmd!
  autocmd BufWritePre * let &bex = '.' . strftime("%Y-%m-%d") . '.bak'
augroup END
set viminfo+=n$HOME/.vim/.viminfo

" wildmenu
set wildmenu wildignorecase
set wildignore^=*.bmp,*.gif,*.jpg,*.png,*.ico,*.bak,*.mkv,
  \*.ogg,*.webm,*.mp4,*.m4v,*.flac,*.alac,*.m4a,*.mp3,*.ape,
  \*.wav,*.pdf,*.psd,*.zip,*.7z,*.tar,*.gz,*.exe,*.swp,
  \node_modules/*,bower_components/*,pack/*

" tabs/spaces
set expandtab
set softtabstop=2
set shiftwidth=2

" list variables
set listchars=tab:■■,trail:»,nbsp:■
set list

" jump to last known cursor position when opening file
augroup curpos
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" show line numbers only in active window
set numberwidth=2
augroup nurnu
  autocmd!
  autocmd WinEnter,BufWinEnter * setlocal relativenumber
  autocmd WinLeave * setlocal norelativenumber
augroup END

" keep window position when switching buffers
augroup bufpos
  autocmd!
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter *
    \ if(exists("b:winview")) |
    \   call winrestview(b:winview) |
    \ endif
augroup END

" automatically create and load sessions
augroup sess
  autocmd!
  if(argc() == 0)
    autocmd VimEnter * nested :call sessions#Load()
  endif
  autocmd VimLeave * :call sessions#Make()
augroup END

"" CUSTOM COMMANDS
" trim trailing whitespaces
command! Trim call trimspace#Trim()

" clear quickfix/clist
command! Cclear cexpr []

"" MAPPINGS
" leader
let mapleader = "\<Space>"

" reload vimrc
nnoremap <silent> <leader>R  :source $HOME/.vim/vimrc<CR>

" space as pgup and pgdown
nnoremap <C-Space>           <C-b>
nnoremap <C-@>               <C-b>
nnoremap <leader><Space>     <C-f>
xnoremap <C-Space>           <C-b>
xnoremap <C-@>               <C-b>
xnoremap <leader><Space>     <C-f>

" system clipboard copy/paste
nnoremap <leader>y           "+y
nnoremap <leader>Y           "+Y
xnoremap <leader>y           "+y
nnoremap <silent> <leader>P  :set paste<CR>"+p:set nopaste<CR>

" open files down the tree
nnoremap <leader>o           :e **/*
nnoremap <leader>a           :arga **/*

" write file
nnoremap <silent> <leader>s  :update<CR>
xnoremap <silent> <leader>s  <esc>:update<CR>gv

" marks
nnoremap <silent> <leader>m  :marks<CR>:normal '
nnoremap `                   '
nnoremap '                   `

" buffers
nnoremap <leader>l           :ls<CR>:b<Space>
nnoremap <leader>d           :ls<CR>:bd<Space>
nnoremap <silent> <leader>n  :bn<CR>
nnoremap <silent> <leader>p  :bp<CR>
nnoremap <silent> <BS>       <C-^>

" windows
nnoremap <silent> <leader>wf :close<CR>
nnoremap <silent> <leader>wd :close<CR>
nnoremap <silent> <leader>f  :close<CR>
nnoremap <silent> <leader>wh :call mvsplit#Mv ('h')<CR>
nnoremap <silent> <leader>wj :call mvsplit#Mv ('j')<CR>
nnoremap <silent> <leader>wk :call mvsplit#Mv ('k')<CR>
nnoremap <silent> <leader>wl :call mvsplit#Mv ('l')<CR>
nnoremap <silent> <C-h>      :call mvsplit#Mv ('h')<CR>
nnoremap <silent> <C-j>      :call mvsplit#Mv ('j')<CR>
nnoremap <silent> <C-k>      :call mvsplit#Mv ('k')<CR>
nnoremap <silent> <C-l>      :call mvsplit#Mv ('l')<CR>
nnoremap <silent> <leader>ww <C-w>w
nnoremap <silent> <Right>    :vertical resize +3<CR>
nnoremap <silent> <Left>     :vertical resize -3<CR>
nnoremap <silent> <Down>     :resize +3<CR>
nnoremap <silent> <Up>       :resize -3<CR>

" tabs
nnoremap <silent> <leader>t  :tabnew<CR>
nnoremap <silent> gK         :tabmove -1<CR>
nnoremap <silent> gJ         :tabmove +1<CR>

" registers
nnoremap <silent> <leader>"  :reg0123456789<CR>
nnoremap <silent> <leader>r  :call copyregister#Cp()<CR>

" clear hlsearch
nnoremap <silent> Q          :noh<CR>

" execute macro over visual range
xnoremap @                   :<C-u>call visualmacro#At()<CR>

" EasyAlign
nmap     ga                  <Plug>(EasyAlign)
xmap     ga                  <Plug>(EasyAlign)
nnoremap     <leader>A       :packadd vim-easy-align <bar>
                              \ echo "easy-align loaded"<CR>
xnoremap     <leader>A       :<C-u>packadd vim-easy-align <bar>
                              \ echo "easy-align loaded"<CR>gv

" netrw
nnoremap <silent> <leader>e  :Lexplore<CR>

" undo tree
nnoremap <silent> <leader>u  :UndotreeToggle<CR>

" colorizer
nnoremap <leader>c           :packadd colorizer<CR>:ColorToggle<CR>

