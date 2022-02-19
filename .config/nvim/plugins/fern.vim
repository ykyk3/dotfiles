"" fern
let g:fern#renderer = 'nerdfont'
nnoremap <silent> <Leader>e :<C-u>Fern . -drawer<CR>
nnoremap <silent> <Leader>E :<C-u>Fern . -drawer -reveal=%<CR>
function! s:fern_settings() abort
  echo "setting fern"
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction
augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
let g:cursorhold_updatetime = 100 " in milisecond
"
" augroup my-glyph-palette
"   autocmd! *
"   autocmd FileType fern call glyph_palette#apply()
"   autocmd FileType nerdtree,startify call glyph_palette#apply()
" augroup END
