return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- C++ (HFT Standard)
        cpp = { "clang-format" },
        c = { "clang-format" },
        -- Python (Sorters + Formatter)
        python = { "isort", "black" },
        -- Rust (Uses the standard rustfmt)
        rust = { "rustfmt" },
        -- Bash/Shell
        sh = { "beautysh" },
      },
      -- Optional: Keep Format on Save enabled
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    -- NEW KEYMAP: <leader>fm to format
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000, -- Increased timeout for heavy C++ or Rust files
      })
    end, { desc = "Format file or range" })
  end,
}
