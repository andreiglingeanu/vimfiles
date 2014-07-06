" Vundle Plugins {{{ "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
" Awesome rails.vim
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
"Plugin 'scrooloose/syntastic'
"Plugin 'bling/vim-airline'
Plugin 'tpope/vim-markdown'
Plugin 'airblade/vim-rooter'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-fugitive'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'ervandew/matchem'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'scrooloose/nerdtree'
"Plugin 'flomotlik/vim-livereload'
"Plugin 'othree/html5.vim'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'vim-scripts/nginx.vim'
"Plugin 'bilalq/lite-dfm'
"Plugin 'xuwupeng2000/vim-rails-apidock'
"Plugin 'junegunn/seoul256.vim'
"Plugin 'goldfeld/vim-seek'
Plugin 'tpope/vim-sleuth'
"Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-vinegar'
Plugin 'xsbeats/vim-blade'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'marijnh/tern_for_vim'
Plugin '29decibel/vim-stringify'
Plugin 'depuracao/vim-rdoc'
Plugin 'evidens/vim-twig'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
" Ultisnips
Plugin 'SirVer/ultisnips'
" Ultisnips snippets
Plugin 'honza/vim-snippets'


" End list of plugins
call vundle#end()

filetype plugin indent on

" leader key
let mapleader=","

" }}}  "

" Basic Editing Configuration {{{ "

" autoread file when changed
set autoread
" set modelines
set modeline
" use visual bell instead of beeping
set visualbell
" show number column
set number
set numberwidth=1
set hidden
" save lots of lines to undo
set history=1000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" round scrollign to a multiple of shiftwidth
set shiftround
" show search match
set showmatch
" increasing search
set incsearch
" highlight search results
set hlsearch
" makes searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
" draw a column after 80 chars, useful for formating code
set colorcolumn=80
" commmand line height
set cmdheight=1
" copy indent from previous line
set autoindent
" set smartindent
set switchbuf=useopen
" show tab line only when there is more than one tab
set showtabline=1
" backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
" undo closed files
set undofile
" directory to store temporary undos
set undodir=/tmp/vimundo
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enably syntax highlighting
syntax on
" fancy ex mode
set wildmode=full
" make tab completion for files/buffers act like bash
set wildmenu
" set list chars
set list
set listchars=tab:\.\ ,trail:-,eol:\¬
set linebreak
" show break symbol
set showbreak=>\
" correct encodings
set encoding=utf-8
set fileencoding=utf-8
" o-prefixed numbers are still decimal
set nrformats-=octal

" Fix slow O inserts
" ":set timeout timeoutlen=1000 ttimeoutlen=100
" Set the tag file search order
set tags=./tags;

" }}} Basic Editing Configuration "

" Folding Options {{{ "
set foldcolumn=1
" toggle Fold
set foldmethod=marker
" }}} Folding Options "

" GUI Options {{{ "
set linespace=5
set guioptions-=T
set guioptions-=m
set guioptions-=e
set guioptions-=L
set guioptions-=r
set guioptions+=lrb
set guioptions-=lrb
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=
" }}} GUI Options "

" Custom AutoCMDS {{{ "
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType php  setlocal keywordprg=pman

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \   exe "normal g`\"" |
              \ endif

  autocmd FileType ruby,pascal,haml,eruby,yaml,html,sass,cucumber,css 
              \ set ai sw=2 sts=2 et
  autocmd FileType python,javascript set ai sw=4 sts=4 et
  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

  autocmd! FileType mkd setlocal syn=off

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
 
  " Clear the search buffer when hitting return
  function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
  endfunction
  call MapCR()

  autocmd! FileType c  map <leader>r :! clear && make %:r && ./%:r<cr>
  autocmd  FileType c map <leader>v :! clear && valgrind ./%:r<cr>
  autocmd  FileType c map <leader>g :! clear && cgdb ./%:r<cr>
  autocmd! FileType asm  map <leader>r :! clear && gcc -o %:r -m32 % && ./%:r<cr>
  autocmd! FileType pascal map <leader>r :! clear && pc %:r && ./%:r<cr>
  autocmd! FileType php  map <leader>r :! clear && php %<cr>
  autocmd! FileType javascript  map <leader>r :! clear && node %<cr>
  autocmd! FileType perl  map <leader>r :! clear && perl %<cr>
  autocmd! FileType ruby map <Leader>r :!clear && ruby %<cr>

  command! -nargs=* -complete=file -bar JavaCompile ! clear && javac-algs4 % && java-algs4 %:r <args>

  autocmd! FileType java  map <leader>r :JavaCompile<space>

  autocmd FileType scheme map <leader>r :! clear && racket -e '(load "%")'<cr>

  au BufRead,BufNewFile *.ru setfiletype ruby

  autocmd BufNewFile,BufRead *_spec.rb compiler rspec
  " .ru and .thor are Ruby.
  au BufRead,BufNewFile *.ru set filetype=ruby
  au BufRead,BufNewFile *.thor set filetype=ruby
  au BufRead,BufNewFile Guardfile set filetype=ruby
  au BufRead,BufNewFile Rakefile set filetype=ruby
augroup END

" }}} Custom AutoCMDS "

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
map <leader>f <C-^>
" Move around split with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" toggle window
map <leader>w <c-w>w
" toggle fold
nnoremap <Space> za
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Scoala, PASCAL
autocmd FileType pascal inoremap <C-l> <space>:=<space>
autocmd FileType st inoremap <C-l> <space>:=<space>

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" toggle list chars
nmap <leader>l :set list!<cr>

" Upcase a WORD
imap <C-u> <C-c>bgUeea


" }}} Misc Key Maps "

" Plugins configuration {{{ "

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
map <Leader>m :call UltiSnips_ListSnippets()<cr>
autocmd! FileType php :UltiSnipsAddFiletypes php
autocmd! FileType eruby :UltiSnipsAddFiletypes eruby
autocmd! FileType ruby :UltiSnipsAddFiletypes ruby
autocmd! FileType css :UltiSnipsAddFiletypes css
autocmd! FileType javascript :UltiSnipsAddFiletypes javascript
autocmd! FileType hmtl :UltiSnipsAddFiletypes html

""""""""""""""
"  supertab  "
""""""""""""""
let g:SuperTabCrMapping = 0

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
map <leader><leader>t <C-p>
map <leader><leader>y :CtrlPBuffer<cr>
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
map <leader>y <C-y>n
map <leader>Y <C-y>N
vmap <leader>w <C-y>,

"""""""""""""""""
"  delimitmate  "
"""""""""""""""""
imap <C-K> <Plug>delimitMateS-Tab
let delimitMate_expand_cr=1
" }}} Plugins configuration "

" Arrow Keys are unacceptable {{{ "
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>
imap <Left> <esc>:echo "no!"<cr>i
imap <Right> <esc>:echo "no!"<cr>i
imap <Up> <esc>:echo "no!"<cr>i
imap <Down> <esc>:echo "no!"<cr>i
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
map <leader>n :call RenameFile()<cr>

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

autocmd FileType ruby map <F6> :call Ruby_eval_insert_hash()<cr>
autocmd FileType ruby inoremap <F6> <C-R>=Ruby_eval_insert_hash()<cr>
autocmd FileType ruby map <F4> :call Ruby_eval_no_align()<cr>
autocmd FileType ruby inoremap <F4> <C-R>=Ruby_eval_no_align()<cr>
autocmd FileType ruby map <leader><leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby map  <leader><leader>M 0f#Dx0

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
au FileType ruby :map <leader>p :PromoteToLet<cr>

" }}} Promote variable to rspec let "

" Vim as hex editor {{{ "

map <leader>h :%!xxd<cr>
map <leader>H :%!xxd -r<cr>

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
nmap <F9> mz:execute TabToggle()<CR>'z

" }}} Toggle between tabs and spaces "

" Live vimrc {{{ "

" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
  "autocmd bufwritepost .vimrc :AirlineRefresh
endif
nmap <leader>vr :edit $MYVIMRC<CR>

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
