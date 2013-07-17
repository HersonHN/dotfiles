:nnoremap <F5> :silent w \| silent make %:r \| ! clear && ./%:r && rm %:r <CR>
