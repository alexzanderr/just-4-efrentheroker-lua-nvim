

require("luasnip/loaders/from_vscode").load()





-- all nvim-cmp sub plugins configured in one setup
-- https://github.com/hrsh7th/cmp-nvim-lua
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/saadparwaiz1/cmp_luasnip

-- it should be local cmp
-- otherwise, mapping will have an error
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require"luasnip".lsp_expand(args.body)
		end
	},
	-- in this order they will appear in the box
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'nvim_lua' },
		{
			name = 'tmux',
			  opts = {
				all_panes = false,
				label = '[tmux]',
				trigger_characters = { '.' },
				trigger_characters_ft = {} -- { filetype = { '.' } }
			  }
		}
	},
	mapping = {
	  -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  -- ['<CR>'] = cmp.mapping.confirm({
	  --   select = true,
	  --   behavior = cmp.ConfirmBehavior.Replace,
	  -- }),
	  ['<CR>'] = cmp.mapping.abort(),
	  ['<tab>'] = cmp.mapping.confirm({
		select = true,
		-- behavior = cmp.ConfirmBehavior.Replace,
	  }),
	},
	formatting = {
	  format = function(entry, vim_item)
		-- fancy icons and a name of kind
		vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

		-- set a name for each source
		vim_item.menu = ({
		  buffer = "[Buffer]",
		  nvim_lsp = "[LSP]",
		  luasnip = "[LuaSnip]",
		  nvim_lua = "[Lua]",
		  latex_symbols = "[Latex]",
		  -- https://github.com/andersevenrud/compe-tmux/issues/6
		  tmux = "[tmux]"
		})[entry.source.name]
		return vim_item
	  end,
	},
})

-- require('lspconfig')[''].setup {
-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

local noremap_silent = {
	noremap = true,
	silent = true
}


local noremap_silent_expr = {
	noremap = true,
	silent = true,
	expr = true
}


-- nnoremap function
local nnoremap_expr = function(trigger_key, command)
	vim.api.nvim_set_keymap('n', trigger_key, command, noremap_silent_expr)
end


-- vnoremap function
local inoremap_expr = function(trigger_key, command)
	vim.api.nvim_set_keymap('i', trigger_key, command, noremap_silent_expr)
end

inoremap_expr("<Down>",  "pumvisible() ? \"<Down>\" : \"<C-O>gj\"")
inoremap_expr("<Up>",  "pumvisible() ? \"<Up>\" : \"<C-O>gk\"")

-- inoremap_expr("<tab>",  "pumvisible() ? \"<Return>\" : \"<tab>\"")


-- TODO
-- make cmp select the first element always
-- map control+space to refresh
-- make lsp completion primary instead of buffer text ones (sort completion options)
