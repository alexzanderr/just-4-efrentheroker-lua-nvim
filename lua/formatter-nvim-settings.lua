
-- formatter.nvim
-- https://github.com/mhartington/formatter.nvim
--
-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md

require('formatter').setup({
  filetype = {
	go = {
		function()
			return {
				exe = "gofmt",
				args = {
					vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
				},
				stdin = true
			}
		end
	},
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
		  -- https://prettier.io/docs/en/options.html
          args = {"--stdin-filepath", "--tab-width 4", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
	json = {
      -- prettier
      function()
        return {
          exe = "prettier",
		  -- https://prettier.io/docs/en/options.html
          args = {"--stdin-filepath", "--tab-width 4", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    sh = {
        -- Shell Script Formatter
       function()
         return {
           exe = "shfmt",
           args = { "-i", 4 },
           stdin = true,
         }
       end,
	},
    lua = {
        -- lua-format
        function()
          return {
            exe = "lua-format",
            args = {
				"-c",
				"~/Alexzander__/manjaro-21-xfce/dotfiles/config_home/lua-format/config"
			},
            stdin = true
          }
        end
    },
    cpp = {
        -- clang-format
       function()
          return {
            exe = "clang-format",
            args = {
				"--assume-filename",
				"--style=\"{BasedOnStyle: chromium, IndentWidth: 4}\"",
				vim.api.nvim_buf_get_name(0)
			},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    },
	c = {
        -- clang-format
       function()
          return {
            exe = "clang-format",
            args = {
				"--assume-filename",
				"--style=\"{BasedOnStyle: chromium, IndentWidth: 4}\"",
				vim.api.nvim_buf_get_name(0)
			},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    },
	python = {
        -- black
		-- some issues with numpy arrays
		-- https://stackoverflow.com/questions/58584413/black-formatter-ignore-specific-multi-line-code
       function()
          return {
            exe = "autopep8",
            args = {
				"--max-line-length 80",
				"--ignore errors",
				vim.api.nvim_buf_get_name(0)
			},
			-- this needs to be false to work
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    },
  }
})

vim.api.nvim_set_keymap("n", "<C-A-l>", ":FormatWrite<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-A-l>", "<C-o>:FormatWrite<CR>", {noremap = true, silent = true})
