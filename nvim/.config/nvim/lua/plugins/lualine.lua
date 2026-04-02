return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Custom function to get the Python venv name
		local function python_venv()
			if vim.bo.filetype ~= "python" then
				return ""
			end

			-- Check for venv-selector or standard VIRTUAL_ENV
			local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				-- Return just the name of the folder (e.g., '.venv' or 'my-project')
				return " " .. string.match(venv, "[^/]+$")
			end
			return ""
		end

		require("lualine").setup({
			options = {
				theme = "auto", -- Automatically matches your colorscheme (Catppuccin, etc.)
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- One single bar at the bottom even with splits
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" }, -- Your Git Branch lives here
				lualine_c = { { "filename", path = 1 } }, -- 'path = 1' shows relative path
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { python_venv }, -- Your Python Env shows up here
				lualine_z = { "location" },
			},
		})
	end,
}
