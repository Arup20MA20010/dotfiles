return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- This line is CRITICAL: it loads the friendly-snippets into LuaSnip
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
