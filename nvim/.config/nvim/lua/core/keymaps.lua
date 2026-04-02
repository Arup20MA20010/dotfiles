local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Custom 3-way Number Toggle
local function toggle_numbering()
	local nu = vim.wo.number
	local rnu = vim.wo.relativenumber

	if nu == true and rnu == true then
		-- State 1 (Relative) -> Move to State 2 (Absolute)
		vim.opt.relativenumber = false
		vim.opt.number = true
		print("Numbering: Absolute")
	elseif nu == true and rnu == false then
		-- State 2 (Absolute) -> Move to State 3 (None)
		vim.opt.number = false
		vim.opt.relativenumber = false
		print("Numbering: Off")
	else
		-- State 3 (None) -> Move back to State 1 (Relative)
		vim.opt.number = true
		vim.opt.relativenumber = true
		print("Numbering: Relative")
	end
end

keymap("n", "<leader>rn", toggle_numbering, { desc = "Toggle Numbering (Rel/Abs/Off)" })

-- Window Navigation (Ctrl + hjkl)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Resizing
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quality of Life
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear Highlight" })

-- Visual Mode Indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- SPLITTING
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Vertical" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontal" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

-- NAVIGATION (Ctrl + hjkl)
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- RESIZING (Ctrl + Arrows)
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- TABS
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
-- Show diagnostics in a floating window
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Move between diagnostics (Go to next/previous "W")
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
