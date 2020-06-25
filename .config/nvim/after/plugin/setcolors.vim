" Adapted from WEREWOLF
"" version 1.2.1
"" changes your colorscheme depending on the time of day
"" by Jonathan Stoler

let g:light_theme = ['one']
let g:dark_theme = ['one-dark']
let g:morning = 7
let g:night = 19

let s:autocmd_allowed = 0

function! ToggleBackground()
	if &background == "light"
		set background=dark
		g:BuffetSetCustomColors()
	else
		set background=light
		g:BuffetSetCustomColors()
	endif
endfunction

function! ChangeColors()
	if strftime("%H") >= g:morning && strftime("%H") < g:night
		call Transform(g:dark_theme, g:light_theme)
	else
		call Transform(g:light_theme, g:dark_theme)
	endif
endfunction

function! Transform(current, switch)
	let i = 0
	while i < len(a:current)
		if g:colors_name ==# a:current[i]
			execute "colorscheme " . a:switch[i]
			ToggleBackground()
			" if we don't do this check, Werewolf's own ColorScheme autocmd will
			" run infinitely; this limits when it happens
			if s:autocmd_allowed
				doau ColorScheme one
				let s:autocmd_allowed = 0
			endif
			return
		endif
		let i += 1
	endwhile
endfunction

function! ColorschemeChanged()
	let s:autocmd_allowed = 0
	call Transform(g:light_theme + g:dark_theme, g:dark_theme + g:light_theme)
endfunction

function! AutoChangeColors()
    let s:autocmd_allowed = 1
    call ChangeColors()
endfunction

augroup autoDark
	autocmd!
	autocmd ColorScheme * nested call ColorschemeChanged()
	autocmd CursorMoved,CursorHold,CursorHoldI,WinEnter,WinLeave,FocusLost,FocusGained,VimResized,ShellCmdPost * nested call AutoChangeColors()
augroup END