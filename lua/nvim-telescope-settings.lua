-- nvim-telescope
--
-- plugin url
-- https://github.com/nvim-telescope/telescope.nvim
--
--
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        layout_config = {
            width = 0.99,
            -- width_padding = 0,
            height = 0.99,

			-- preview is set to left
			mirror = true
            -- horizontal = {
            --     width_padding = 0.1,
            --     height_padding = 0.1,
            --     preview_width = 0.6,
            --     mirror = false,
            -- },
            -- vertical = {
            --     width_padding = 0.05,
            --     height_padding = 1,
            --     preview_height = 0.5,
            --     mirror = true,
            -- },

        },
        layout_strategy = "horizontal",
        -- mirror_layout = { horizontal = true, vertical = false },
        prompt_prefix = "➤  ",

        mappings = {
            -- make sure you exit telescope using <ESC> and <C-q>
            -- this came out from a reddit post
            -- https://www.reddit.com/r/neovim/comments/ny9pxy/quit_telescope_without_confirmation/
            i = {
                ["<esc>"] = require("telescope.actions").delete_buffer,
                ["<C-q>"] = "delete_buffer",
                -- ["<C-e>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
                ["<esc>"] = require("telescope.actions").delete_buffer,
                ["<C-q>"] = "delete_buffer",
                -- ["<C-e>"] = actions.send_to_qflist + actions.open_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = false,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:

-- fzf native integrator plugin
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- commenting this will improve performance of telescope
require("telescope").load_extension("fzf")

-- find files using control + f
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("i", "<C-f>", "<C-o>:Telescope find_files<CR>", {
    noremap = true,
    silent = true,
})

-- find content from all files in current project using shift f
vim.api.nvim_set_keymap("n", "<S-f>", ":Telescope live_grep<CR>", {
    noremap = true,
    silent = true,
})
-- vim.api.nvim_set_keymap("i", "<S-f>", "<C-o>:Telescope live_grep<CR>", { noremap = true, silent = true })

-- find in opened buffers
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<CR>", {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("i", "<C-b>", "<C-o>:Telescope buffers<CR>", {
    noremap = true,
    silent = true,
})

-- recent projects
vim.api.nvim_set_keymap("n", "<C-w>", ":Telescope projects<CR>", {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("i", "<C-w>", "<C-o>:Telescope projects<CR>", {
    noremap = true,
    silent = true,
})

-- current file
vim.api.nvim_set_keymap("i", "<A-f>",
                        "<C-o>:Telescope current_buffer_fuzzy_find<CR>", {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap("n", "<A-f>",
                        ":Telescope current_buffer_fuzzy_find<CR>", {
    noremap = true,
    silent = true,
})

-- {
--   bottom_pane = {
--     height = 0.99
--   },
--   center = {
--     height = 0.99,
--     preview_cutoff = 40,
--     width = 0.99
--   },
--   cursor = {
--     height = 0.99,
--     preview_cutoff = 40,
--     width = 0.99
--   },
--   height = 0.99,
--   horizontal = {
--     height = 0.99,
--     preview_cutoff = 120,
--     prompt_position = "bottom",
--     width = 0.99
--   },
--   vertical = {
--     height = 0.99,
--     preview_cutoff = 40,
--     width = 0.99
--   },
--   width = 0.99,
--   width_padding = 0
-- }

-- TODO
-- stop telescope to leave in insert mode when exiting
-- and scroll between results
--
--
-- very good telescope commands
--
-- Telescope lsp_document_diagnostics -> errors and warnings for current file
--
-- Telescope lsp_workspace_diagnostics -> errors and warnings for entire project
--
-- :Telescope current_buffer_fuzzy_find - find content in current file
--
-- :Telescope lsp_document_symbols - current file elements
--
-- :Telescope lsp_dynamic_workspace_symbols -- symbols in entire workspace
--
-- :Telescope commands - all commands
--
-- :Telescope builtin - telescope's functions
--
-- :Telescope git_files - dar nu are git signs
--
-- :Telescope oldfiles - recent files
--
-- Telescope git_commits
--
-- Telescope grep_string - search just in string
--
--
-- :Telescope command_history
--
-- :Telescope colorscheme
--
--
-- :Telescope lsp_references
--
-- :Telescope lsp_definitions
--
-- :Telescope projects
--
-- :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.5}})
