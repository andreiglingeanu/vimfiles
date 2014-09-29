source ~/vimfiles/plugins.vim

filetype plugin indent on

" leader key
let mapleader=" "

source ~/vimfiles/basic_options.vim
source ~/vimfiles/folding.vim
source ~/vimfiles/gui.vim
source ~/vimfiles/autocommands.vim
source ~/vimfiles/runners.vim

" Color {{{ "

" Use 256 colors (Use this only if your terminal supports 256 colours)
set t_Co=256

set background=dark
if !has("gui_running")
  "colorscheme t256
  "colorscheme desert256
  "colorscheme devbox-dark-256
  " let g:seoul256_background = 256
  colorscheme molokai
  let g:molokai_original=1
  set background=dark
else
  colorscheme codeschool
endif

" }}} Color "

" Status Line {{{ "
set laststatus=2
" set statusline=%<%f\ %y%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %y%m%r%=%-14.(%l,%c%V%)\ %P
" }}} Status Line "

" Misc Key Maps {{{ "
" Toggle between two files
noremap <leader>f <C-^>
" Move around split with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" toggle window
noremap <leader>w <c-w>w
" toggle fold
nnoremap <Space>z za
" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>
" Scoala, PASCAL
autocmd FileType pascal inoremap <C-l> <space>:=<space>
autocmd FileType st inoremap <C-l> <space>:=<space>

" add newline with control-enter
" http://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter
inoremap <C-j> <esc>O

" Tab mappings
noremap <leader>pt :tabnew<cr>
noremap <leader>pe :tabedit
noremap <leader>pc :tabclose<cr>
noremap <leader>po :tabonly<cr>
noremap <leader>pn :tabnext<cr>
noremap <leader>pp :tabprevious<cr>
noremap <leader>pf :tabfirst<cr>
noremap <leader>pl :tablast<cr>
noremap <leader>pm :tabmove

" toggle list chars
nnoremap <leader>l :set list!<cr>

" Upcase a WORD
inoremap <C-u> <C-c>bgUeea
" Upcase a WORD in normal mode
nnoremap <C-u> viwU

" Indent line back with shift-tab
inoremap <s-tab> <c-d>

" }}} Misc Key Maps "

" Rails mappings {{{ "
" open routes
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>S <c-w>s<c-w>K:enew<cr>
map <leader>gs :topleft :split db/schema.rb<cr>
map <leader>gL :topleft :split config/locales<cr>
nnoremap <leader>F  :CtrlP .<cr>
nnoremap <leader>gv :CtrlP app/views<cr>
nnoremap <leader>gc :CtrlP app/controllers<cr>
nnoremap <leader>gm :CtrlP app/models<cr>
nnoremap <leader>gh :CtrlP app/helpers<cr>
nnoremap <leader>gl :CtrlP lib<cr>
nnoremap <leader>gp :CtrlP public<cr>
nnoremap <leader>gS :CtrlP app/assets/stylesheets<cr>
nnoremap <leader>gj :CtrlP app/assets/javascripts<cr>
nnoremap <leader>gf :CtrlP features<cr>
" }}} Rails mappings "

" rspec test runner {{{ "
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" }}} rspec test runner "

" Plugins configuration {{{ "

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
let g:syntastic_enable_signs = 1    " Put errors on left side
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
" }}} Plugins configuration "

" Arrow Keys are unacceptable {{{ "
noremap <Left> :echo "no!"<cr>
noremap <Right> :echo "no!"<cr>
noremap <Up> :echo "no!"<cr>
noremap <Down> :echo "no!"<cr>
inoremap <Left> <esc>:echo "no!"<cr>i
inoremap <Right> <esc>:echo "no!"<cr>i
inoremap <Up> <esc>:echo "no!"<cr>i
inoremap <Down> <esc>:echo "no!"<cr>i
cnoremap <Left> <esc>:echo "no!"<cr>i
cnoremap <Right> <esc>:echo "no!"<cr>i
cnoremap <Up> <esc>:echo "no!"<cr>i
cnoremap <Down> <esc>:echo "no!"<cr>i
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}} Arrow Keys are unacceptable "

" Rename Current FIle {{{ "

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
noremap <leader>n :call RenameFile()<cr>

" }}} Rename Current FIle "

" XMPFILTER Settings {{{ "

let g:xmpfilter_cmd = "xmpfilter -a --no-warnings"
map <F5> <Plug>(xmpfilter-run)
imap <F5> <Plug>(xmpfilter-run)


function! Ruby_eval_insert_hash()
  let curline=line(".")
  exec "normal A # => \<esc>\<F5>\0"
  exec "normal ggVG:Tabularize /# =>\<cr>"
  execute 'silent '.curline
  unlet curline
endfunction

function! Ruby_eval_no_align()
  exec "normal A # => \<esc>\<F5>\0"
endfunction

autocmd FileType ruby noremap <F6> :call Ruby_eval_insert_hash()<cr>
autocmd FileType ruby inoremap <F6> <C-R>=Ruby_eval_insert_hash()<cr>
autocmd FileType ruby noremap <F4> :call Ruby_eval_no_align()<cr>
autocmd FileType ruby inoremap <F4> <C-R>=Ruby_eval_no_align()<cr>
autocmd FileType ruby noremap <leader><leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby noremap  <leader><leader>M 0f#Dx0

" }}} XMPFILTER Settings "

" Promote variable to rspec let {{{ "

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
au FileType ruby :command! PromoteToLet :call PromoteToLet()
au FileType ruby :noremap <leader>p :PromoteToLet<cr>

" }}} Promote variable to rspec let "

" Vim as hex editor {{{ "

noremap <leader>h :%!xxd<cr>
noremap <leader>H :%!xxd -r<cr>

" }}} Vim as hex editor "

" Set tabstop, softtabstop and shiftwidth to the same value {{{ "

command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" }}} Set tabstop, softtabstop and shiftwidth to the same value "

" Toggle between tabs and spaces {{{ "

" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction
nnoremap <F9> mz:execute TabToggle()<CR>'z

" }}} Toggle between tabs and spaces "

" Live vimrc {{{ "

" Source the vimrc file after saving it
if has("autocmd")
  "autocmd! bufwritepost .vimrc source $MYVIMRC
  "autocmd bufwritepost .vimrc :AirlineRefresh
endif
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>

" }}} Live vimrc "

" Ngingx {{{ "
au BufRead,BufNewFile /etc/nginx/*,nginx.conf,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 
" }}} Ngingx "

" Airline {{{ "
"let g:airline_powerline_fonts = 1
"let g:airline_theme='molokai'
"let g:airline_theme='luna'
"let g:airline_left_sep='['
"let g:airline_right_sep=']'
"let g:airline_linecolumn_prefix = '§'
"let g:airline_paste_symbol = 'Þ'
"let g:airline_readonly_symbol = 'Ʀ'
" }}} Airline "

" Allowed vim modeline commands {{{ "
 let g:git_modelines_allowed_items = [
                 \ "textwidth",   "tw",
                 \ "softtabstop", "sts",
                 \ "tabstop",     "ts",
                 \ "shiftwidth",  "sw",
                 \ "expandtab",   "et",   "noexpandtab", "noet",
                 \ "filetype",    "ft",
                 \ "foldmethod",  "fdm",
                 \ "readonly",    "ro",   "noreadonly", "noro",
                 \ "rightleft",   "rl",   "norightleft", "norl",
                 \ "cindent",     "cin",  "nocindent", "nocin",
                 \ "smartindent", "si",   "nosmartindent", "nosi",
                 \ "autoindent",  "ai",   "noautoindent", "noai",
                 \ "spell",
                 \ "spelllang"
                 \ ]
" }}} Allowed vim modeline commands "

" Abbreviations {{{ "
iabbrev @@@ andrei.glingeanu@gmail.com
" }}} Abbreviations "

" Open changed files {{{ "
" Open a split for each dirty file in git
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
" }}} Open changed files "

" Insert time {{{ "
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
" }}} Insert time "

" The Little Schemer {{{ "
  autocmd FileType scheme map <leader>r :!clear && racket % -e ~/Projects/scheme/the_little_schemer/tls.ss <cr>
  autocmd FileType scheme let b:delimitMate_quotes = ""
" }}} The Little Schemer "
