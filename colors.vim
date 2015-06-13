" Use 256 colors (Use this only if your terminal supports 256 colours)
set t_Co=256

set background=dark
if !has("gui_running")
  colorscheme t256
  "colorscheme desert256
  "colorscheme devbox-dark-256
  " let g:seoul256_background = 256
  " colorscheme molokai
  " let g:molokai_original=1
  set background=dark
else
  colorscheme codeschool
endif

