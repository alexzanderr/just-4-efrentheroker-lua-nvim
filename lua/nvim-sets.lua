
-- init.lua contains all of the initialization plugins for vim note;
-- This has to be sourced second since dein needs to run its scripts first.
-- This contains misc startup settings for vim
local g = vim.g     -- global variable
local set = vim.opt -- set options
local cmd = vim.cmd -- vim command

cmd('syntax on')
cmd('syntax enable')
cmd('filetype indent plugin on')

set.hidden = true
set.title = true
set.background = 'dark'
set.termguicolors = true

-- line number
set.number = true
-- no swap files
set.swapfile = false

 -- allow unrestricted backspacing in insert mode
set.backspace = 'indent,eol,start'
set.mouse = 'a'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileformat = 'unix'

set.scrolloff = 0
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.autoindent = true

-- set.colorcolumn = 100
set.cursorline = true

-- Always show signcolumns
set.signcolumn = 'yes'

-- set case insensitive search for commands
set.ignorecase = true
set.infercase = true

-- used for making quotes appear in json files and markdown
-- if its set to 2, then quotes will disappear
-- setlocal conceallevel=0
-- but having this to zero, indentLine wont work

-- used for realoding the current file if its modified in other place
set.autoread = true

set.cmdheight = 1

set.shell = '/usr/bin/zsh'

set.backup = false
set.writebackup = true

-- for command line menu
set.compatible = false
set.wildmenu = true
set.wildmode = 'full'

set.showmode = false
set.showcmd = false
set.ruler = false
set.laststatus = 2
set.splitright = true
set.foldenable = false
-- goes to the end of line + 1 when pressing <end>
set.virtualedit = 'onemore'
set.linebreak = true
set.breakindent = true

-- this is not working
set.iskeyword = set.iskeyword - '#'


-- for better performance
set.viminfo = "'1000,<10000,s10000,h"
set.lazyredraw = true
set.ttyfast = true

set.regexpengine = 1
set.relativenumber = false
set.synmaxcol = 400

-- this gives error
-- " https://vi.stackexchange.com/questions/5196/how-to-change-the-behavior-of-cursor-motions-ex-go-from-one-line-to-the-end-o

set.whichwrap = set.whichwrap + '<,>,h,l'

set.autochdir = false

-- word wrap
set.wrap = true


-- https://github.com/dinhmai74/dotfile-lua/blob/95542e6cc418dd1d995a4d2b4cfb1a82dd1e6733/nvim/lua/init.lua#L37-L46
-- to set vim variables using -= | +=
set.shortmess = set.shortmess + 'c'

set.fillchars = set.fillchars + 'diff:╱'

cmd("colorscheme onedark")

-- https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim/
-- highlight yanked text
-- enable tree sitter manually, because somehow it doesnt work just for python
cmd [[
	autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
	autocmd BufEnter * execute ':TSBufEnable highlight'
	autocmd BufEnter * execute ':TSBufEnable indent'
	autocmd FileType scss setl iskeyword+=@-@
	autocmd BufRead,BufNewFile *.json set filetype=jsonc
	match Underlined /http[s]\?:\/\/[[:alnum:]%\/_#.-]*/
]]

-- cmd [[

-- augroup tspythondisable
--     au!
--     au FileType python TSBufEnable highlight
-- augroup END

-- ]]
	-- au FileType python TSBufEnable indent

vim.g.cursorhold_updatetime = 100
