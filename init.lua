
-- for f in glob(/home/user/.config/nvim/vim-plug/*.vim, 0, 1)
--    execute 'source' f
-- endfor

-- local vim_function = vim.fn
-- print(vim_function.glob('/home/alexzander/Alexzander__/manjaro-21-xfce/dotfiles/config_home/nvim/lua/*.lua'))



-- local configuration_files = vim_function.glob('/home/alexzander/Alexzander__/manjaro-21-xfce/dotfiles/config_home/nvim/lua/*.lua')


-- for configuration in configuration_files:gmatch("[^\r\n]+") do
--     require(configuration)
-- end
-- https://github.com/rockerBOO/awesome-neovim#wishlist
--
-- improve performance
-- https://www.reddit.com/r/neovim/comments/opipij/guide_tips_and_tricks_to_reduce_startup_and/
--
-- docs
--
-- https://github.com/nanotee/nvim-lua-guide#calling-vimscript-functions
-- packer and plugins
require('plugins')


-- built-in settings
require('keybindings')
require('nvim-sets')
require("abbreviations")


-- plugins settings
-- cmp needs to be first
require("nvim-cmp-settings")

require('lualine-settings')
require('solarized-theme-settings')
require("nvim-tree-settings")
require("nvim-lspinstall-settings")
require("gitsigns-settings")
require("nvim-comment-settings")
require("nvim-autopairs-settings")


require("lspsaga-nvim-settings")
-- require("fzf-lua-settings")
require("nvim-telescope-settings")
-- finder for everything

require("tree")
require("luasnip-settings")
require("project-nvim-settings")
require("toggleterm-nvim-settings")
require("nvim-colorizer-lua-settings")
require("dashboard-nvim-settings")


require("trim-nvim-settings")
require("indent-blankline-nvim-settings")
-- require("aerial-nvim-settings")
require("lspkind-nvim-settings")
require("symbols-outline-nvim-settings")
require("neogit-settings")
-- require("nvim-lspfuzzy-settings")


-- require("lsp-colors-settings")
-- require("nvim-lsputils-settings")

-- tabline
-- you cannot use barbar and bufferline at the same time
-- it will give error
-- commeting barbar in packer.nvim will fix
require("bufferline-nvim-settings")
-- require("barbar-nvim-settings")
require("formatter-nvim-settings")
require("diffview-nvim-settings")

require("lsp-settings")
require("nvim-treesitter-settings")
require("lsp-signature-settings")
require("vim-visual-multi-settings")
require("quickscope-settings")
require("one-small-step-for-vimkind-settings")

-- TODO
-- choose which one is the best
-- telescope or fzf lua
--
--
--
-- TODO fix this
-- require("vimux-settings")
--
--
-- and close all buffers when a buffer is closed


-- TODO has synatx error
-- require("rnvimr-settings")
--
-- DashRun doesnt print ansi codes

-- ➤

-- TODO
-- packer lazy load plugins, just if there is a slow startup time
--
--
--
--
--
--
