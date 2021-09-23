local noremap = {
    noremap = true,
}

local noremap_silent = {
    noremap = true,
    silent = true,
}

local noremap_silent_expr = {
    noremap = true,
    silent = true,
    expr = true,
}

-- nnoremap function
local nnoremap = function(trigger_key, command, silent, expr)
    -- default value is true
	if silent == false then
		silent = false
    elseif not silent then
        silent = true
    end
    -- default value is false
	if expr == false then
		expr = false
    elseif not expr then
        expr = false
    end

    vim.api.nvim_set_keymap("n", trigger_key, command, {
        noremap = true,
        silent = silent,
        expr = expr,
    })
end


-- vnoremap function
local inoremap = function(trigger_key, command)
    vim.api.nvim_set_keymap("i", trigger_key, command, noremap_silent)
end


-- vnoremap function
local vnoremap = function(trigger_key, command, silent)
    vim.api.nvim_set_keymap("v", trigger_key, command, noremap_silent)
end


-- tnoremap function (terminal mode)
local tnoremap = function(trigger_key, command)
    vim.api.nvim_set_keymap("t", trigger_key, command, noremap_silent)
end


-- tnoremap function (terminal mode)
local cnoremap = function(trigger_key, command)
    vim.api.nvim_set_keymap("c", trigger_key, command, noremap_silent)
end


local map = vim.api.nvim_set_keymap
local execute = vim.api.nvim_command
local co = "<C-o>"
local esc = "<esc>"

-- disable space in normal mode
map("n", "<Space>", "<NOP>", noremap_silent)
vim.g.mapleader = " "

-- disable f1
map("n", "<F1>", "<nop>", noremap_silent)
map("i", "<F1>", "<nop>", noremap_silent)

-- save current buffer
function SaveCurrentBuffer()
    if vim.bo.modifiable == true then
        vim.cmd("w!")
    else
        print("buffer is not modifiable")
    end
end

map("n", "<C-s>", ":lua SaveCurrentBuffer()<CR>", noremap_silent)
map("v", "<C-s>", esc .. ":lua SaveCurrentBuffer()<CR>", noremap_silent)
map("i", "<C-s>", co .. ":lua SaveCurrentBuffer()<CR>", noremap_silent)

-- quit neovim
function QuitBuffer()
    SaveCurrentBuffer()
    vim.cmd("q!")

    -- TODO
    -- print buffer name and file type when closing
    -- print("buffer closed")
end


map("n", "<C-q>", ":lua QuitBuffer()<CR>", noremap_silent)
map("i", "<C-q>", co .. ":lua QuitBuffer()<CR>", noremap_silent)
map("v", "<C-q>", esc .. ":lua QuitBuffer()<CR>", noremap_silent)
map("c", "<C-q>", ":lua QuitBuffer()<CR>", noremap_silent)

function QuitNeovim()
    -- first of all we need to save buffer before quiting
    SaveCurrentBuffer()

end

-- exit in terminal using esc
-- map("t", "<esc>", "<C-\\><C-n>", noremap_silent)

-- open url
function OpenURL()
    vim.cmd("execute 'normal gx'")

    local under_cursor = vim.fn.line()
    print(under_cursor .. "opened")
end

nnoremap("<c-space>", ":lua OpenURL()<CR>")

-- go back
map("n", "<A-Left>", "<C-o>", noremap_silent)

-- go forward
map("n", "<A-Right>", "<C-i>", noremap_silent)

-- nnoremap("<C-c>", "<cmd> lua copy_current_line_to_clipboard()<CR>")
-- inoremap("<C-c>", "<C-o><cmd> lua copy_current_line_to_clipboard()<CR>")

-- control + backspace to delete a word backwards
-- map("i", "<C-BS>", "<C-w>", noremap_silent)
-- map("i", "<C-h>", "<C-w>", noremap_silent)
--
--
-- this doesnt work
-- map("c", "<C-BS>", "<C-w>", noremap_silent)
-- map("c", "<C-h>", "<C-w>", noremap_silent)

-- this also mapped in command mode
-- i dont know how to simulate bang in lua vim api
vim.cmd[[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]]


-- use colon instead of semi-colon for command-line mode
-- TODO fix this, make it not silent
nnoremap(";", ":", false)
vnoremap(";", "<esc>:", false)

-- undo
map("n", "<C-z>", "u", noremap_silent)
map("i", "<C-z>", "<C-o>u", noremap_silent)
map("v", "<C-z>", "<esc>u", noremap_silent)

-- redo
-- redo for normal mode is built-in
map("i", "<C-r>", "<C-o><C-r>", noremap_silent)

-- control + x to delete the line
-- i to enter insert mode"
-- nnoremap <C-X> yyddi
-- you must use + for linux in order to put it in system clipboard"
-- https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim"

map("n", "<C-x>", "\"+yydd", noremap_silent)

-- inoremap <C-X> <C-O>"+yydd
-- not working in neovim 0.5 nightly bin
map("i", "<C-x>", "<esc>\"+yyddi", noremap_silent)

-- with gv you can reselect the lost zone
map("v", "<C-x>", "\"+ygvd", noremap_silent)

-- block jump
-- up
nnoremap("<C-A-up>", "{")
inoremap("<C-A-up>", "<C-o>{")
-- down
nnoremap("<C-A-down>", "}")
inoremap("<C-A-down>", "<C-o>}")

-- copy current line to sys clipboard

local colored = require("ansi-colors")

function copy_current_line_to_clipboard()
    vim.cmd("execute 'normal \"+yy'")
    print(colored("%{red}line copied to clipboard%{reset}"))
end


nnoremap("<C-c>", "<cmd> lua copy_current_line_to_clipboard()<CR>")
inoremap("<C-c>", "<C-o><cmd> lua copy_current_line_to_clipboard()<CR>")
-- nnoremap("<C-c>", "\"+yy")
-- inoremap("<C-c>", "<C-o>\"+yy")
vnoremap("<C-c>", "\"+ygv")
tnoremap("<C-c>", "<C-o>\"+yy")

-- paste from system clipboard
-- this is broken
-- it doesnt insert new line to paste properly
-- but running "+p along in cmd works
nnoremap("<C-v>", "\"+p")
inoremap("<C-v>", esc .. "\"+yp")
vnoremap("<C-v>", "\"+pgv")

-- backspace in visual mode
vnoremap("<bs>", "d")

-- select all
nnoremap("<C-a>", "ggVG")
inoremap("<C-a>", esc .. "ggVG")
vnoremap("<C-a>", esc .. "ggVG")

-- highlight the entire paragraph
nnoremap("<C-S-Up>", "<S-v>{")
inoremap("<C-S-Up>", "<ESC><S-v>{")

nnoremap("<C-S-Down>", "<S-v>}")
inoremap("<C-S-Down>", "<ESC><S-v>}")

-- move line up with alt + up
-- with auto indent
-- nnoremap <silent> <A-Up> :move -2<CR>==
nnoremap("<A-Up>", ":move -2<CR>")
nnoremap("<A-Down>", ":move +1<CR>")

-- move line up in visual mode and keep selection
vnoremap("<A-Up>", ":move '<-2<CR>gv=gv")
-- move line down in visual mode and keep selection
vnoremap("<A-Down>", ":move '>+1<CR>gv=gv")

-- este ineficient ca sta sa ruleze de fiecare data
-- inoremap <silent> <A-Up> <C-O>:move -2<CR><C-o>==
-- move line down with alt + down
inoremap("<A-Up>", "<C-O>:move -2<CR>")
inoremap("<A-Down>", "<C-O>:move +1<CR>")

-- this works well only in visual-line mode
-- duplicate the line up
nnoremap("<S-A-Up>", "\"+yyP")
inoremap("<S-A-Up>", "<ESC>\"+yyPa")
vnoremap("<S-A-Up>", "\"+yPgv")

-- duplicate the line down
nnoremap("<S-A-Down>", "\"+yyp")
inoremap("<S-A-Down>", "<ESC>\"+yyPi")
vnoremap("<S-A-Down>", "\"+yPgv")

-- vertical split pane to right
-- to left we cant because C-[ is actually ESC ..
nnoremap("<C-]>", ":vsplit<CR>")
inoremap("<C-]>", co .. ":vsplit<CR>")
vnoremap("<C-]>", "<ESC>:vsplit<CR>v")

-- insert tab space in visual mode
vnoremap("<tab>", ">gv")
vnoremap("<S-tab>", "<gv")

-- control right
-- if you are on the last word and the there is nothing after last word
-- with 'e' you will go at the end of the word
-- with 'w' you will go after the end of the word, on the next line
-- map("n", "<C-Right>", "e", noremap_silent)
-- navigate with control left/right arrow
-- normally vim jumps to the text space, i want to jump to the next word
nnoremap("<C-Right>", "e")
-- maybe will make performance worse ?
inoremap("<C-Right>", co .. "e")

nnoremap("<C-Left>", "b")
-- maybe will make performance worse ?
inoremap("<C-Left>", co .. "b")

-- indent/unindent with tab/shift-tab
nnoremap("<S-Right>", ">>")
nnoremap("<S-Left>", "<<")

inoremap("<S-Left>", "<C-O><<")
inoremap("<S-Right>", "<C-O>>>")

vnoremap("<S-Left>", "<gv")
vnoremap("<S-Right>", ">gv")

-- resize current buffer with keyboard
nnoremap("`<Left>", "2<C-W><")
nnoremap("`<Right>", "2<C-W>>")
nnoremap("`<Up>", "2<C-W>-")
nnoremap("`<Down>", "2<C-W>+")

-- select to end of the line from current cursor position
inoremap("<S-End>", "<ESC>v<End>")
nnoremap("<S-End>", "v<End>")

-- select to the beginnging of the line from current cusor position
inoremap("<S-Home>", "<ESC>v<Home>")
nnoremap("<S-Home>", "v<Home>")

-- enter in insert mode from visual
-- by default just i doesnt work
vnoremap("i", "<S-i>")

-- scroll with keyboard
nnoremap("<C-Up>", "<C-Y>")
inoremap("<C-Up>", "<C-o><C-Y>")
nnoremap("<C-Down>", "<C-E>")
inoremap("<C-Down>", "<C-o><C-E>")

-- delete a word from any position of the cursor on the current word
-- if you are on beginning, it deletes the entire word
-- if you are on middle, it deletes the entire word
-- if you are on end, it deletes the entire word
nnoremap("<S-Del>", "diw")
inoremap("<S-Del>", "<C-O>diw")

-- copy text between quotes
nnoremap("<S-c>", "\"+yi\"")

-- select all text between quotes (" ") including quotes
nnoremap("<S-s>", "va\"")

-- when normal mode enter insert mode and insert new line to write on the line
nnoremap("<CR>", "o")
-- new line before
nnoremap("<A-cr>", "O")
inoremap("<A-cr>", "<C-o>O")

-- navigate splitted panes
-- left
nnoremap("<C-S-A-Left>", "<C-W>h")
tnoremap("<C-S-A-Left>", "<C-\\><C-N><C-W>h")
-- right
nnoremap("<C-S-A-Right>", "<C-W>l")
tnoremap("<C-S-A-Right>", "<C-\\><C-N><C-W>l")
-- up
nnoremap("<C-S-A-Up>", "<C-W>k")
nnoremap("<C-S-A-Up>", "<C-\\><C-N><C-W>k")
-- down
nnoremap("<C-S-A-Down>", "<C-W>j")
tnoremap("<C-S-A-Down>", "<C-\\><C-N><C-W>j")

-- open url
nnoremap("<C-space>", "gx")

-- home and end to the actual home and end
inoremap("<Home>", "<C-o>g^")
inoremap("<End>", "<C-o>g$")
-- jump to the beginning of the line in insert mode without exiting insert mode
nnoremap("<Home>", "g^")
nnoremap("<End>", "g$")

-- up and down over long lines
nnoremap("<Up>", "gk")
nnoremap("<Down>", "gj")

-- previous visited tab
nnoremap("<S-tab>", ":b#<CR>")
inoremap("<S-tab>", "<C-o>:b#<CR>")

-- delete a word backwards
nnoremap("<C-Del>", "dw")
inoremap("<C-Del>", "<C-O>dw")
-- cw is better ca uneori vreau sa pastrez spatiu

-- select current line with control L
nnoremap("<C-l>", "<S-v>\"+y<S-v><end>")
inoremap("<C-L>", "<Esc><S-v>\"+y<S-v><end>")

-- word wrap
function ToggleWordWrap()
    if vim.wo.wrap == true then
        vim.wo.wrap = false
        print("line wrap is OFF")
    else
        vim.wo.wrap = true
        print("line wrap is ON")
    end
end


nnoremap("<A-z>", ":lua ToggleWordWrap()<CR>")

NVIM_INIT_LUA = os.getenv("NVIM_INIT_LUA")

-- reload neovim
function ReloadNeovim()
    local current_buffer_name = vim.fn.expand("%:t")
    vim.cmd("wa!")
    vim.cmd("source ~/.config/nvim/init.lua")
    vim.cmd("e")
    local current_time = vim.fn.strftime("%H:%M:%S")
    print("[init.lua] + [" .. current_buffer_name .. "] reloaded at " ..
              current_time)
end


nnoremap("<F5>", ":lua ReloadNeovim()<CR>")
inoremap("<F5>", co .. ":lua ReloadNeovim()<CR>")
vnoremap("<F5>", esc .. ":lua ReloadNeovim()<CR>")


-- delete file permanently
function DecisionPrompt(file_name)
    local decision = vim.fn.input("delete (permanently) file: " .. file_name .. " ?? [y/n]:\n>>> ")
    return decision
end

function DeleteFilePermanently()
    local file_name = vim.fn.expand('%:t')
    local decision = DecisionPrompt(file_name)
    if decision == "y" then
		vim.fn.delete(vim.fn.expand("%"))
		vim.cmd("bdelete!")
		-- print("\nfile deleted | action cannot be undone\n")
		-- print("buffer closed")
		vim.cmd("NvimTreeRefresh")
	else
		print("file deletion aborted")
	end
end


nnoremap("<C-S-del>", ":lua DeleteFilePermanently()<CR>")
inoremap("<C-S-del>", co .. ":lua DeleteFilePermanently()<CR>")


-- create new file
-- https://vim.fandom.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
function CreateNewFile()
	local filename = vim.fn.input("new file: ")
	vim.cmd("e " .. filename)
	vim.cmd("w!")
	-- print(filename .. " created at " .. vim.cmd("pwd"))
end


nnoremap("<A-a>", ":lua CreateNewFile()<CR>")
inoremap("<A-a>", co .. ":lua CreateNewFile()<CR>")
vnoremap("<A-a>", esc .. ":lua CreateNewFile()<CR>")

nnoremap("q", "<nop>")
