" From http://www.stephendiehl.com/posts/vim_haskell.html

" Refresh tags
map <silent> tu :call GHC_BrowseAll()<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
