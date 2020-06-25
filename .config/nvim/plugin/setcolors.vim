let hr = str2nr(strftime('%H'))
if hr < 7 || hr >= 19
    set background=dark
    colorscheme onedark
    g:BuffetSetCustomColors()
else
    set background=light        " for the light version
    colorscheme one
    g:BuffetSetCustomColors()
endif

let g:one_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256

" Cargo.toml
highlight link Crates Comment
