augroup runners
  autocmd!

  autocmd! FileType c
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && make %:r && ./%:r

  autocmd FileType c
        \ command! -nargs=* -complete=file -bar Valgrind
        \ ! clear && valgrind ./%:r

  autocmd FileType c
        \ command! -nargs=* -complete=file -bar Debug
        \ ! clear && cgdb ./%:r

  autocmd! FileType asm
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && gcc -o %:r -m32 % && ./%:r

  autocmd! FileType javascript
        \ command! -nargs=* -complete=file -bar Runner ! clear && node %

  autocmd! FileType php
        \ command! -nargs=* -complete=file -bar Runner ! clear && php %

  autocmd! FileType pascal
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && pc %:r && ./%:r

  autocmd! FileType perl
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && perl %

  autocmd! FileType ruby
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && ruby

  autocmd! FileType java
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && javac % && java %:r

  autocmd! FileType scheme
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && racket -e '(load "%")'

  autocmd! FileType sml
        \ command! -nargs=* -complete=file -bar Runner
        \ ! clear && sml %

  " command!
        " \ -nargs=* -complete=file -bar JavaCompile
        " \ ! clear && javac-algs4 % && java-algs4 %:r <args>
augroup END
