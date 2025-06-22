require "nvchad.options"

-- add yours here!


local function load_options()

	local function isempty(s)
		return s == nil or s == ""
	end
	local function use_if_defined(val, fallback)
		return val ~= nil and val or fallback
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
	else
		vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
		vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
	end

	-- custom sqlite3 provider
	-- local sqlite_clib_path = os.getenv("SQLITE_CLIB_PATH")
	-- if not isempty(sqlite_clib_path) then
	-- 	-- Try environment variable first
	-- 	vim.g.sqlite_clib_path = sqlite_clib_path
	-- elseif global.is_windows then
	-- 	-- Fix sqlite3 missing-lib issue on Windows
	-- 	-- Download the DLLs form https://www.sqlite.org/download.html
	-- 	vim.g.sqlite_clib_path = global.home .. "/Documents/sqlite-dll-win64-x64-3400200/sqlite3.dll"
	-- end

end

-- Newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
-- vim.g.netrw_liststyle = 3

load_options()
local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99






