return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	branch = "regexp",
	config = function()
		require("venv-selector").setup({
			settings = {
				search = {
					-- We'll define a custom search for your specific Mac path
					anaconda_base = {
						command = "fd python$ /Users/arupbaral/anaconda3/envs --full-path --color never",
						type = "anaconda",
					},
					-- This covers any venv inside your current HFT project folder
					project_local = {
						command = "fd bin/python$ . --max-depth 2 --color never",
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
	},
}
