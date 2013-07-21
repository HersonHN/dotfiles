
if has("gui_macvim")
    """ for some reason I can't use "clear" on macvim
    :nnoremap <F5> :silent w \| make %:r \| echo "\n\n\n\n" \| ! %:r && rm %:r <CR>
else
    :nnoremap <F5> :silent w \| make %:r \| ! clear && %:r && rm %:r <CR>
endif


