local cu = {}

cu.esc = "<esc>"
cu.co = "<C-o>"
cu.cr = "<CR>"

cu.noremap = {
	noremap = true
}

cu.noremap_silent = {
    noremap = true,
    silent = true,
}

cu.noremap_silent_expr = {
    noremap = true,
    silent = true,
    expr = true,
}

-- nnoremap function
cu.nnoremap = function(trigger_key, command, silent, expr)
	-- default value is true
	silent = silent and true
	-- default value is false
	expr = expr and false

	vim.api.nvim_set_keymap('n', trigger_key, command, {
		noremap = true,
		silent = silent,
		expr = expr
	})
end


-- vnoremap function
cu.inoremap = function(trigger_key, command, silent, expr)
	-- default value is true
	silent = silent and true
	-- default value is false
	expr = expr and false

	vim.api.nvim_set_keymap('i', trigger_key, command, {
		noremap = true,
		silent = silent,
		expr = expr
	})

end


-- vnoremap function
cu.vnoremap = function(trigger_key, command, silent, expr)
	-- default value is true
	silent = silent and true
	-- default value is false
	expr = expr and false

	vim.api.nvim_set_keymap('v', trigger_key, command, {
		noremap = true,
		silent = silent,
		expr = expr
	})
end


-- tnoremap function (terminal mode)
cu.tnoremap = function(trigger_key, command, silent, expr)
	-- default value is true
	silent = silent and true
	-- default value is false
	expr = expr and false

	vim.api.nvim_set_keymap('t', trigger_key, command, {
		noremap = true,
		silent = silent,
		expr = expr
	})
end


return cu
