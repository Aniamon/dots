local g = vim.g
local o = vim.o
local cmd = vim.cmd
local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

o.number = true
o.numberwidth = 4
o.scrolloff = 8
o.clipboard = "unnamedplus"
o.tabstop = 4
o.shiftwidth = 4
o.ingorecase = true
o.termguicolors = true
o.mouse = nil
o.splitbelow = true
o.splitright = true

g.python_recommended_style = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'catppuccin/nvim',
	{'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup()
	end},
	'kyazdani42/nvim-web-devicons',
	{'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup()
	end},
})

cmd('colorscheme catppuccin')
