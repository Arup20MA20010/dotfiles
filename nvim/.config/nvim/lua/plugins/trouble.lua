return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		modes = {
			diagnostics = {
				win = {
					-- INCREASE THIS: 15 to 20 is usually the "sweet spot"
					size = 18,
					position = "bottom",
				},
			},
			symbols = {
				win = {
					-- For the side panel (symbols), width is what matters
					size = 0.25, -- 25% of the screen width
					position = "right",
				},
			},
		},
		-- Common settings
		auto_close = true,
		restore_window_config = true,
	},
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Project Diagnostics (Trouble)",
		},
		{
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references (Trouble)",
		},
	},
}
