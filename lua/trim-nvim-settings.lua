

-- trim-nvim
--
-- plugin url
-- https://github.com/cappyzawa/trim.nvim
--
--
require('trim').setup({
	-- if you want to ignore markdown file.
	-- you can specify filetypes.
	disable = {"markdown"},

	-- if you want to ignore space of top
	patterns = {
	  [[%s/\s\+$//e]],
	  [[%s/\($\n\s*\)\+\%$//]],
	  [[%s/\(\n\n\)\n\+/\0/]],
	},
})
-- the last one needs to be zero in order to disable 1 line between block chunks
-- with this setting only trailing whitespace before and after lines will be deleted, not the one between lines
