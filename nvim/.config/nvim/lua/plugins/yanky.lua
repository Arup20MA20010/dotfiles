return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 20,
        storage = "shada", -- Persists history even after restarting Nvim
      },
      highlight = {
        on_put = true, -- Flash the text briefly when you paste
        on_yank = true,
        timer = 200,
      },
    })

    -- KEYMAPS
    -- Cycle through history AFTER pasting
    vim.keymap.set("n", "<C-p>", "<Plug>(YankyCycleForward)")
    vim.keymap.set("n", "<C-n>", "<Plug>(YankyCycleBackward)")

    -- Open the "Clipboard Manager" menu (uses Telescope)
    vim.keymap.set("n", "<leader>p", function()
        require("telescope").load_extension("yank_history")
        require("telescope").extensions.yank_history.yank_history()
    end, { desc = "Open Yank History" })
  end,
}


