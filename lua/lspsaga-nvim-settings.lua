
-- lspsaga-nvim
--
-- plugin url
-- https://github.com/glepnir/lspsaga.nvim


-- dont map this to just simple 'd'
-- because it will detect default key from vim and it will
-- have a short delay of 2 seconds


local noremap_silent = {
	noremap = true,
	silent = true
}

-- nnoremap function
local nnoremap = function(trigger_key, command)
	vim.api.nvim_set_keymap('n', trigger_key, command, noremap_silent)
end


-- vnoremap function
local inoremap = function(trigger_key, command)
	vim.api.nvim_set_keymap('i', trigger_key, command, noremap_silent)
end

nnoremap("<A-d>", ":Lspsaga preview_definition<CR>")
nnoremap("<C-h>", ":Lspsaga hover_doc<CR>")
nnoremap("<A-r>", ":Lspsaga lsp_finder<CR>")
nnoremap("<A-e>", ":Lspsaga diagnostic_jump_next<CR>")
nnoremap("<C-e>", ":Lspsaga diagnostic_jump_prev<CR>")
nnoremap("<F2>", ":Lspsaga rename<CR>")

require 'lspsaga'.init_lsp_saga {
	use_saga_diagnostic_sign = true,
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	dianostic_header_icon = '   ',
	code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
	rename_prompt_prefix = 'rename ➤',
	rename_action_keys = {
	  quit = '<esc>', exec = '<CR>'  -- quit can be a table
	}
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
}
