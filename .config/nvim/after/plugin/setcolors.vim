" Set color scheme according to current time of day.
let hr = str2nr(strftime('%H'))
if hr < 7 || hr >= 17
    set background=dark
    let g:one_allow_italics = 0
    let g:onedark_terminal_italics = 1
    let g:onedark_hide_endofbuffer = 1
    let g:onedark_termcolors = 256
    colorscheme onedark
else
    set background=light        " for the light version
    let g:one_allow_italics = 1
    let g:onedark_terminal_italics = 0
    let g:onedark_hide_endofbuffer = 0 
    colorscheme one
endif

