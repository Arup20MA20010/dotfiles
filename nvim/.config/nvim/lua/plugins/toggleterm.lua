return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<A-i>]], -- Maps Alt+i (Option+i on Mac) to toggle
			direction = "float",
			float_opts = {
				border = "rounded",
			},
			-- Integrated navigation: Ctrl+hjkl works inside the terminal too
			on_open = function(term)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true })
			end,
		})
	end,
}
