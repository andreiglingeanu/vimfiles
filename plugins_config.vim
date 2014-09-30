" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
noremap <Leader>m :call UltiSnips_ListSnippets()<cr>
autocmd! FileType php :UltiSnipsAddFiletypes php
autocmd! FileType eruby :UltiSnipsAddFiletypes eruby
autocmd! FileType ruby :UltiSnipsAddFiletypes ruby
autocmd! FileType css :UltiSnipsAddFiletypes css
autocmd! FileType javascript :UltiSnipsAddFiletypes javascript
autocmd! FileType hmtl :UltiSnipsAddFiletypes html
autocmd! FileType c :UltiSnipsAddFiletypes c
autocmd! FileType cpp :UltiSnipsAddFiletypes cpp
autocmd BufNewFile,BufRead *.scss set filetype=css


""""""""""""""
"  supertab  "
""""""""""""""
let g:SuperTabCrMapping = 0

""""""""""""""""
"  switch.vim  "
""""""""""""""""
nnoremap <leader>o :Switch<cr>

"""""""""""""""
"  rails.vim  "
"""""""""""""""
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
let g:ruby_path = "/usr/bin/ruby"

""""""""""""""
"  syntasic  "
""""""""""""""
let g:syntastic_check_on_open = 1
" let g:syntastic_enable_signs = 1    " Put errors on left side
let g:syntastic_quiet_warnings = 1  " Only errors, not warnings please
let g:syntastic_disabled_filetypes = ['html']
if has('unix')
  let g:syntastic_error_symbol = '★'
  let g:syntastic_style_error_symbol = '>'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_style_warning_symbol = '>'
else
  let g:syntastic_error_symbol = '!'
  let g:syntastic_style_error_symbol = '>'
  let g:syntastic_warning_symbol = '.'
  let g:syntastic_style_warning_symbol = '>'
endif

"""""""""""
"  ctrlp  "
"""""""""""
map <leader><leader>y :CtrlPBuffer<cr>
map <leader><leader>t :CtrlPTag<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0

"""""""""""
"  emmet  "
"""""""""""
imap <C-@> <C-y>,
imap <C-e> <C-y>,
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:emmet_html5=1
let g:use_emmet_complete_tag=1
nmap <leader>y <C-y>n
nmap <leader>Y <C-y>N
vmap <leader>w <C-y>,

"""""""""""""""""
"  delimitmate  "
"""""""""""""""""
imap <C-K> <Plug>delimitMateS-Tab
let delimitMate_expand_cr=1
