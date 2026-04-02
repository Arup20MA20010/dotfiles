return {
	-- High-performance themes
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },

	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local theme_cache = vim.fn.stdpath("data") .. "/current_theme.txt"

			vim.keymap.set("n", "<leader>th", function()
				require("telescope.builtin").colorscheme({
					enable_preview = true,
					ignore_builtins = true,
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							local selection = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							-- Apply and Save
							vim.cmd("colorscheme " .. selection.value)
							local f = io.open(theme_cache, "w")
							if f then
								f:write(selection.value)
								f:close()
								-- Using vim.notify for a cleaner HFT-style look
								vim.notify("Theme persisted: " .. selection.value, vim.log.levels.INFO)
							end
						end)
						return true
					end,
				})
			end, { desc = "Theme Picker (Persistent)" })
		end,
	},
}
