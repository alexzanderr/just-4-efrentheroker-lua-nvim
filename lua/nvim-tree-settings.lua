
-- plugin url
-- https://github.com/kyazdani42/nvim-tree.lua

-- https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/

local noremap_silent = {
	noremap = true,
	silent = true
}


local noremap_silent_expr = {
	noremap = true,
	silent = true,
	expr = true
}


local map = vim.api.nvim_set_keymap

map('n', '<C-\\>', ":NvimTreeToggle<CR>", noremap_silent)
map('i', '<C-\\>', "<C-o>:NvimTreeToggle<CR>", noremap_silent)
map('v', '<C-\\>', "<esc>:NvimTreeToggle<CR>", noremap_silent)
