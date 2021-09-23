

vim.cmd[[


let g:VimuxHeight = "50"
let g:VimuxOrientation = "h"
let g:VimuxOpenExtraArgs = "-b"
let g:VimuxUseNearest = 0


let g:VimuxCloseOnExit = 1
let g:VimuxPromptString = "enter command for tmux splitted pane: "
let g:VimuxRunnerName = "vscode-code-runner"


" just like vs code runner

function! s:code_runner(below)
	if a:below == 1
		let g:VimuxOrientation = "v"
		let g:VimuxOpenExtraArgs = ""
	endif

	if &modified == 1
		w!
	endif

	if &filetype == "python"
		let buffer_name = bufname("%")
		if buffer_name == "manage.py"
			call VimuxRunCommand("python3 manage.py runserver 9000")
		else
			call VimuxRunCommand("python3 " . buffer_name)
		endif

	elseif &filetype == "javascript"
		call VimuxRunCommand("node " . bufname("%"))

	elseif &filetype == "go"
		call VimuxRunCommand("go run " . bufname("%"))

	elseif &filetype == "cpp"
		let filename = split(bufname("%"), "\\V.")[0]
		call VimuxRunCommand("g++ " . bufname("%") . " -o " . filename . " && ./" . filename)

	elseif &filetype == "c"
		let filename = split(bufname("%"), "\\V.")[0]
		call VimuxRunCommand("gcc " . bufname("%") . " -o " . filename . " && ./" . filename)

	elseif &filetype == "html"
		let g:VimuxOrientation = "v"
		let g:VimuxOpenExtraArgs = ""
		let g:VimuxHeight = "7"

		call VimuxRunCommand("live-server " . bufname("%"))
	endif

	let g:VimuxHeight = "20"
	let g:VimuxOrientation = "h"
	let g:VimuxOpenExtraArgs = "-b"
endfunction


" code runner orientation to the left side
nnoremap <silent> <C-A-n> :call <SID>code_runner(0)<CR>
inoremap <silent> <C-A-n> <C-o>:call <SID>code_runner(0)<CR>


" code runner orientation below
nnoremap <silent> <C-A-b> :call <SID>code_runner(1)<CR>
inoremap <silent> <C-A-b> <C-o>:call <SID>code_runner(1)<CR>



function! s:markdown_live_server()
	if &modified == 1
		w!
	endif
	if &filetype == "markdown" || &filetype == "txt"
		call VimuxRunCommand("/usr/bin/liveglow " . bufname("%"))
	else
		echo "wrong filetype"
	endif

endfunction

function! s:pytest_compilation()
	if &modified == 1
		w!
	endif
	if &filetype == "python"
		call VimuxRunCommand("pytest -vv " . getcwd() . "/" . expand('%:f'))
	elseif &filetype == "markdown" || &filetype == "txt"
		call VimuxRunCommand("/usr/bin/liveglow " . bufname("%"))
	else
		echo "wrong filetype"
	endif

endfunction

nnoremap <silent> <C-A-m> :call <SID>pytest_compilation()<CR>
inoremap <silent> <C-A-m> <C-o>:call <SID>pytest_compilation()<CR>


nnoremap <silent> <C-A-c> :VimuxClearTerminalScreen<CR>
inoremap <silent> <C-A-c> <C-o>:VimuxClearTerminalScreen<CR>



" nnoremap <silent> <C-m> :call <SID>markdown_live_server()<CR>
" inoremap <silent> <C-m> <C-o>:call <SID>markdown_live_server()<CR>

















]]
