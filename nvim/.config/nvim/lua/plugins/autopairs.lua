return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true, -- Use Treesitter to be smarter (don't pair inside strings/comments)
			ts_config = {
				lua = { "string" }, -- Don't add pairs in lua string nodes
				javascript = { "template_string" },
			},
			fast_wrap = {
				map = "<M-e>", -- Alt+e to wrap the next word in brackets
			},
		})

		-- Integration with your completion engine (Blink.cmp)
		-- This ensures that when you select a function from the menu,
		-- it automatically adds the () for you.
	end,
}
