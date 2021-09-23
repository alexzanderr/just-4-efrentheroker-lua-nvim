


vim.cmd[[

	" for first plugin
	" Make Ranger replace netrw and be the file explorer
	let g:rnvimr_ex_enable = 0
	" Make Ranger to be hidden after picking a file
	let g:rnvimr_enable_picker = 1
	" Disable a border for floating window
	let g:rnvimr_draw_border = 1
	" Hide the files included in gitignore
	let g:rnvimr_hide_gitignore = 0
	" Change the border's color
	" let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
	" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
	let g:rnvimr_enable_bw = 0
	" Add a shadow window, value is equal to 100 will disable shadow
	" let g:rnvimr_shadow_winblend = 70


	" Link CursorLine into RnvimrNormal highlight in the Floating window
	highlight link RnvimrNormal CursorLine

	" Map Rnvimr action
	let g:rnvimr_action = {
		\ '<CR>': 'NvimEdit tabedit',
		\ '<C-x>': 'NvimEdit split',
		\ '<C-v>': 'NvimEdit vsplit',
		\ 'gw': 'JumpNvimCwd',
		\ 'yw': 'EmitRangerCwd'
	\ }

	" Add views for Ranger to adapt the size of floating window
	let g:rnvimr_ranger_views = [
		\ {'minwidth': 90, 'ratio': []},
		\ {'minwidth': 90, 'maxwidth': 89, 'ratio': [1,1]},
		\ {'maxwidth': 90, 'ratio': [1]}
	\ ]

	" this is responsible for ranger's position, coordinates, width, height inside nvim
	let g:rnvimr_layout = {
		\ 'relative': 'editor',
		\ 'width': float2nr(round(0.98 * &columns)),
		\ 'height': float2nr(round(0.88 * &lines)),
		\ 'col': float2nr(round(0.01 * &columns)),
		\ 'row': float2nr(round(0.05 * &lines)),
		\ 'style': 'minimal'
	\ }

	" Fullscreen for initial layout
	" let g:rnvimr_layout = {
	"            \ 'relative': 'editor',
	"            \ 'width': &columns,
	"            \ 'height': &lines - 2,
	"            \ 'col': 0,
	"            \ 'row': 0,
	"            \ 'style': 'minimal'
	"            \ }

	" for the second plugin
	nnoremap <space>r :RnvimrToggle<CR>
]]
