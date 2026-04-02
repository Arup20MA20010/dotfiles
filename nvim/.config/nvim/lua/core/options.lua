local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.hidden = true
opt.undofile = false
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4 -- C++ Standard
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.cindent = false
opt.termguicolors = true
opt.updatetime = 50
opt.cursorline = true
opt.signcolumn = "yes"
opt.swapfile = false
opt.scrolloff = 8
opt.mouse = "a"

-- Fix the distinct "strip" color to match the main background
local highlights = {
	"LineNr",
	"CursorLineNr",
	"SignColumn",
}

for _, hl in ipairs(highlights) do
	vim.api.nvim_set_hl(0, hl, { bg = "none" })
end

-- Optional: If you want the current line number to pop a bit without a background
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fab387", bold = true, bg = "none" })
