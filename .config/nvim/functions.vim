""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds
" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
	set foldtext=FoldText()
endif

function! FoldText()
	" Get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let foldLevelStr = repeat('+--', v:foldlevel)
	let lineCount = line('$')
	let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
	let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

function! WipeHiddenBuffers()
	let tpbl=[]
	call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
	for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
		silent execute 'bwipeout' buf
	endfor
endfunction

function! s:BufferEmpty()
	let l:current = bufnr('%')
	if ! getbufvar(l:current, '&modified')
		enew
		silent! execute 'bdelete '.l:current
	endif
endfunction

function! s:SweepBuffers()
	let bufs = range(1, bufnr('$'))
	let hidden = filter(bufs, 'buflisted(v:val) && !bufloaded(v:val)')
	if ! empty(hidden)
		execute 'silent bdelete' join(hidden)
	endif
endfunction

" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
function! OpenChangedFiles()
	only " Close all windows, unless they're modified
	let status =
		\ system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
	let filenames = split(status, "\n")
	exec 'edit ' . filenames[0]
	for filename in filenames[1:]
		exec 'sp ' . filename
	endfor
endfunction

function! UninstallUnusedCocExtensions() abort
    for e in keys(json_decode(join(readfile(expand('~/.config/coc/extensions/package.json')), "\n"))['dependencies'])
        if index(s:coc_extensions, e) < 0
            execute 'CocUninstall ' . e
        endif
    endfor
endfunction

function! CheckBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction