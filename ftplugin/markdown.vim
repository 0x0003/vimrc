"   =============== Plugins ===================
packadd goyo.vim
packadd vim-easy-align

"   =============== Mappings ==================
nmap     <leader>a          <nop>
nnoremap <silent> <leader>g :Goyo<CR>:hi StatusLineNC ctermfg=235 <bar>
                              \ set nonu nornu <bar>
                              \ IndentGuidesToggle<CR>

