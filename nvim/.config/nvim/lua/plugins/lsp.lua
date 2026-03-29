return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp", -- The new 2026 standard for speed
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls" }
      })

      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Optimized Clangd for HFT (Background indexing + header insertion)
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "-j=4", -- Use 4 cores for indexing
        },
      })
    end
  },
  {
    "saghen/blink.cmp",
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  }
}
