-- Bootstrap lazy.nvim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- THE FIX: Auto-remove that "strip" whenever ANY colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = { "LineNr", "SignColumn", "FoldColumn", "CursorLineNr" }
		for _, hl in ipairs(hl_groups) do
			vim.api.nvim_set_hl(0, hl, { bg = "none" })
		end
	end,
})

-- Load core modules from lua/*.lua
require("core.options")
require("core.keymaps")

-- Load plugins from lua/plugins/*.lua
require("lazy").setup("plugins")

local theme_cache = vim.fn.stdpath("data") .. "/current_theme.txt"
local default_theme = "catppuccin-mocha" -- Fallback if file doesn't exist

local f = io.open(theme_cache, "r")
if f then
	local saved_theme = f:read("*all"):gsub("%s+", "") -- Read and trim whitespace
	f:close()

	-- Try to apply the saved theme
	local status, _ = pcall(vim.cmd, "colorscheme " .. saved_theme)
	if not status then
		vim.cmd("colorscheme " .. default_theme)
	end
else
	vim.cmd("colorscheme " .. default_theme)
end
