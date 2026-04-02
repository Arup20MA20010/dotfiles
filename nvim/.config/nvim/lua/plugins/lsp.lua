return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			"folke/lazydev.nvim", -- The fix for 'undefined global vim'
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				-- Added the new languages here
				ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "pyright", "bashls" },
			})

			-- 2026 Core LSP Config style
			local lsp = vim.lsp.config
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- 1. Clangd Setup (Optimized for HFT/C++)
			lsp["clangd"] = {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders=true",
				},
			}

			-- RUST (HFT-optimized)
			lsp["rust_analyzer"] = {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" }, -- Catch HFT performance anti-patterns
						procMacro = { enable = true },
					},
				},
			}

			-- PYTHON
			lsp["pyright"] = { capabilities = capabilities }

			-- BASH
			lsp["bashls"] = { capabilities = capabilities }

			-- 2. Lua Setup (Simple because lazydev handles the rest)

			lsp["lua_ls"] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT", -- Neovim uses LuaJIT
						},
						diagnostics = {
							-- This silences 'Undefined global require' and 'Undefined global vim'
							globals = { "vim", "require", "io", "print", "table", "pcall", "get" },
						},
						workspace = {
							-- Pulls in Neovim's internal library paths
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}

			-- 3. Global Keymaps & Diagnostic UI
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- Diagnostics: <leader>gl to see the error popup
					vim.keymap.set("n", "<leader>gl", function()
						vim.diagnostic.open_float({
							border = "rounded",
							source = "always",
							focusable = false,
						})
					end, { buffer = ev.buf, desc = "Line Diagnostics" })

					-- Copy diagnostic to clipboard
					vim.keymap.set("n", "<leader>dc", function()
						-- Get all diagnostics for the current line
						local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
						if vim.tbl_isempty(line_diagnostics) then
							print("No diagnostics found on this line")
							return
						end

						-- Sort by severity (Error > Warning) and get the message
						table.sort(line_diagnostics, function(a, b)
							return a.severity < b.severity
						end)
						local message = line_diagnostics[1].message

						-- Copy to system clipboard ("+")
						vim.fn.setreg("+", message)
						print("Copied diagnostic: " .. message)
					end, { desc = "Copy Diagnostic to Clipboard" })

					-- Code Navigation
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Jumping between warnings/errors
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},

	-- 4. Blink.cmp Configuration
	{
		"saghen/blink.cmp",
		version = "v0.*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				menu = { border = "rounded" },
				documentation = { window = { border = "rounded" } },
			},
		},
	},
}
