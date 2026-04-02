return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- This makes it show your open files
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				color_icons = true,
				-- Stays persistent even if you split the screen
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		-- KEYMAPS for quick navigation
		local map = vim.keymap.set
		map("n", "<S-L>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		map("n", "<S-H>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
		-- Move buffers left/right in the bar
		map("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })
		map("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
	end,
}
