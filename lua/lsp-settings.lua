-- require "lspconfig".jsonls.setup {
--   cmd = {"vscode-json-language-server", "--stdio"},
--   filetypes = {"json", "jsonc"},
--   init_options = {
--     provideFormatter = false
--   },
--   root_dir = function()
--     return vim.loop.cwd()
--   end
-- }
vim.api.nvim_set_keymap("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>", {
    noremap = true,
    silent = true,
})

vim.api.nvim_set_keymap("i", "<F12>", "<C-o>:lua vim.lsp.buf.definition()<CR>",
                        {
    noremap = true,
    silent = true,
})


-- disable diagnostics in insert mode to be more smooth
-- https://github.com/neovim/nvim-lspconfig/issues/127
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- delay update diagnostics
        update_in_insert = false,
    })
