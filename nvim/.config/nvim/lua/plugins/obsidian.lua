return {
	"epwalsh/obsidian.nvim",
	version = "*",
	-- Change lazy to true, but ensure the keys trigger the load
	lazy = true,
	-- This ensures it loads when you open a markdown file OR press a key
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/ObsidianVault/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/ObsidianVault/**.md",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/ObsidianVault",
			},
		},
	},
	keys = {
		-- By putting these here, Lazy will load the plugin the moment you press them
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian Note" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
		{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App" },
		{
			"gf",
			function()
				if require("obsidian").util.cursor_on_markdown_link() then
					return "<cmd>ObsidianFollowLink<CR>"
				else
					return "gf"
				end
			end,
			expr = true,
			desc = "Follow Obsidian Link",
		},
	},
}
