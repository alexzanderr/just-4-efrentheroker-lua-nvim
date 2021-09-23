


-- indent-blankline-nvim
--
-- plugin url
-- https://github.com/lukas-reineke/indent-blankline.nvim
--
--
--
--
local indentline_char = '▏'
-- local indentline_char = "⎢"

require("indent_blankline").setup {
    char = indentline_char,
    buftype_exclude = {"terminal"},
	show_current_context = true,
	context_patterns = {
		"def",
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"string",
		"docstring",
		"comment",
		"self"
		-- ... and you can add more
	},
	show_trailing_blankline_indent = false
	-- use_treesitter = true
}

vim.cmd[[highlight IndentBlanklineContextChar guifg=#f73e3e gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineContextChar guifg=#e3d64d gui=nocombine]]
