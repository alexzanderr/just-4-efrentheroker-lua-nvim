local fn = vim.fn

-- plugins folder
-- /home/alexzander/.local/share/nvim/site/pack/packer/start/..
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd "packadd packer.nvim"
end

return require("packer").startup(function()
    -- Packer can manage itself
    -- package manager made in lua
    use "wbthomason/packer.nvim"

    -- status line made in lua
    use {
        "hoob3rt/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
    }

    -- solarized theme made in lua
    use "ishan9299/nvim-solarized-lua"

    -- nvim tree made in lua
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use {
        "hrsh7th/nvim-cmp",
    }

    -- completion for lua api
    use {
        "hrsh7th/cmp-nvim-lua",
    }

    -- completion for all opened buffers
    use {
        "hrsh7th/cmp-buffer",
    }

    -- completion for file system paths
    use {
        "hrsh7th/cmp-path",
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
    }

    -- completion for all languages depending on the LSP
    use {
        "neovim/nvim-lspconfig",
    }

    -- LSP install manager
    use {
        "kabouzeid/nvim-lspinstall",
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    -- comment line or lines
    use {
        "terrortylor/nvim-comment",
    }

    -- a collection of very much quantity of snippets for many langs
    use {
        "rafamadriz/friendly-snippets",
    }

    -- brackets auto completion
    use {
        "windwp/nvim-autopairs",
    }

    -- TODO
    -- check this plugin
    -- https://github.com/windwp/nvim-ts-autotag

    -- snippets engine
    use {
        "L3MON4D3/LuaSnip",
    }

    -- have that snippets inside cmp
    use {
        "saadparwaiz1/cmp_luasnip",
    }

    -- telescope
    -- fzf written in lua
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-lua/plenary.nvim",
            },
        },
    }

    -- fzf native
    -- used for fast sorting
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }

    -- atom one dark theme in lua
    use {
        "navarasu/onedark.nvim",
    }

    -- barbar nvim tab line written in lua
    -- use {
    --     'romgrk/barbar.nvim',
    --     requires = {'kyazdani42/nvim-web-devicons'}
    -- }

    -- project root path management and telescope integration
    use {
        "ahmedkhalf/project.nvim",
    }

    -- integrated terminal
    use {
        "akinsho/toggleterm.nvim",
    }

    -- nvim colorizer lua, colors the hexa codes and rgbs
    use {
        "norcalli/nvim-colorizer.lua",
    }

    -- TODO
    -- dont forget to lazy load plugins for performance
    --
    --
    --
    --
    -- ramane de vazut
    -- use {
    --     'tamago324/nlsp-settings.nvim'
    -- }

    -- use {
    --     'jose-elias-alvarez/null-ls.nvim'
    -- }

    use {
        "antoinemadec/FixCursorHold.nvim",
    }

    -- startify made in lua and much better
    use {
        "glepnir/dashboard-nvim",
    }

    -- better synatx highlithing
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        branch = "0.5-compat",
    }

    use {
        "nvim-lua/popup.nvim",
    }

    -- TODO: install multi-cursor plugin

    -- preview, references, diagnostics
    use {
        "glepnir/lspsaga.nvim",
    }

    -- delete extra white space
    use {
        "cappyzawa/trim.nvim",
    }

    -- show visual indentation of lines
    use {
        "lukas-reineke/indent-blankline.nvim",
    }

    -- symbols outline
    use {
        "stevearc/aerial.nvim",
    }

    -- completion icons
    use {
        "onsails/lspkind-nvim",
    }

    -- symbols outline (another one)
    use {
        "simrat39/symbols-outline.nvim",
    }

    -- code dark made by chris
    -- use {
    --     'ChristianChiarulli/nvcode-color-schemes.vim'
    -- }

    -- neogit
    -- management for git inside neovim
    use {
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
    }

    -- bufferline.nvim
    -- bufferline is slow on very big project
    -- comparing to barbar
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- a better lsp saga
    -- use {
    --     'RishabhRD/popfix'
    -- }

    -- use {
    --     'RishabhRD/nvim-lsputils'
    -- }

    -- LSP diagnostics, references, definitions, implementation with fzf
    -- use {
    --   'ojroques/nvim-lspfuzzy',
    --   requires = {
    --     {'junegunn/fzf'},
    --     {'junegunn/fzf.vim'},  -- to enable preview (optional)
    --   },
    -- }

    -- lsp colors
    -- errors, warnings, hints and informations
    -- use 'folke/lsp-colors.nvim'

    use {
        "ibhagwan/fzf-lua",
        requires = {
            "vijaymarupudi/nvim-fzf",
            "kyazdani42/nvim-web-devicons",
        }, -- optional for icons
    }

    use "sindrets/diffview.nvim"

    -- prettier formatter
    -- use 'lukas-reineke/format.nvim'

    use "mhartington/formatter.nvim"

    use "dstein64/nvim-scrollview"

    use {
        "ellisonleao/gruvbox.nvim",
        requires = {
            "rktjmp/lush.nvim",
        },
    }

    use {
        "windwp/nvim-ts-autotag",
    }

    use {
        "andersevenrud/compe-tmux",
        branch = "cmp",
    }

    use {
        "ray-x/lsp_signature.nvim",
    }

    use {
        "mg979/vim-visual-multi",
        branch = "master",
    }

    use {
        "unblevable/quick-scope",
    }

    use {
        "kevinhwang91/rnvimr",
    }

    use {
        "jbyuki/dash.nvim",
    }

    use {
        "folke/tokyonight.nvim",
    }

	-- debugger
	use {
		"jbyuki/one-small-step-for-vimkind"
	}

	use {
		"mfussenegger/nvim-dap"
	}

	-- use {
	-- 	"alexghergh/nvim-tmux-navigation"
	-- }

	use {
		"preservim/vimux"
	}
end
)
