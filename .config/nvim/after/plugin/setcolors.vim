let hr = str2nr(strftime('%H'))
if hr < 7 || hr >= 19
    set background=dark
    let g:one_allow_italics = 0
    let g:onedark_terminal_italics = 1
    let g:onedark_hide_endofbuffer = 1
    let g:onedark_termcolors = 256
    colorscheme onedark
    redraw
else
    set background=light        " for the light version
    let g:one_allow_italics = 1
    let g:onedark_terminal_italics = 0
    let g:onedark_hide_endofbuffer = 0
    colorscheme one
    redraw
endif

function! g:BuffetSetCustomColors()
    if &background ==# 'dark'
        hi! BuffetCurrentBuffer cterm=NONE ctermbg=114 ctermfg=240 guibg=#98C379 guifg=#282c34
        hi! BuffetActiveBuffer cterm=NONE ctermbg=251 ctermfg=240 guibg=#C678DD guifg=#282c34
        hi! BuffetBuffer cterm=NONE ctermbg=145 ctermfg=59 guibg=#abb2bf guifg=#2c323d
        hi! BuffetModCurrentBuffer cterm=NONE ctermbg=114 ctermfg=240 guibg=#98C379 guifg=#282c34
        hi! BuffetModActiveBuffer cterm=NONE ctermbg=251 ctermfg=240 guibg=#C678DD guifg=#282c34
        hi! BuffetModBuffer cterm=NONE ctermbg=145 ctermfg=59 guibg=#abb2bf guifg=#2c323d
        hi! BuffetTrunc cterm=NONE ctermbg=38 ctermfg=145 guibg=#61AFEF guifg=#abb2bf
        hi! BuffetTab cterm=NONE ctermbg=18 ctermfg=240 guibg=#56B6C2 guifg=#282c34
    else
        hi! BuffetCurrentBuffer cterm=NONE ctermbg=114 ctermfg=240 guibg=#98C379 guifg=#fafafa
        hi! BuffetActiveBuffer cterm=NONE ctermbg=251 ctermfg=240 guibg=#C678DD guifg=#fafafa
        hi! BuffetBuffer cterm=NONE ctermbg=238 ctermfg=59 guibg=#494b53 guifg=#f0f0f0
        hi! BuffetModCurrentBuffer cterm=NONE ctermbg=114 ctermfg=240 guibg=#98C379 guifg=#fafafa
        hi! BuffetModActiveBuffer cterm=NONE ctermbg=251 ctermfg=240 guibg=#C678DD guifg=#fafafa
        hi! BuffetModBuffer cterm=NONE ctermbg=238 ctermfg=59 guibg=#494b53 guifg=#f0f0f0
        hi! BuffetTrunc cterm=NONE ctermbg=38 ctermfg=238 guibg=#61AFEF guifg=#494b53
        hi! BuffetTab cterm=NONE ctermbg=18 ctermfg=240 guibg=#56B6C2 guifg=#fafafa
    endif
endfunction

" Cargo.toml
highlight link Crates Comment
