

-- nvim-lspinstall plugin settings
--
-- plugin url
-- https://github.com/kabouzeid/nvim-lspinstall

-- extra documnentation
-- https://ka.codes/posts/nvim-lspinstall#nvim-lspinstall

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
	-- if not server == "python" then
	require'lspconfig'[server].setup{
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
	-- end
  end
end

setup_servers()

-- automatically setup servers again after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- makes sure the new server is setup in lspconfig
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
