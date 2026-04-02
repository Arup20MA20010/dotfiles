return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true, -- Safety first for HFT code
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    })

    -- TOGGLE LOGIC: <leader>e to open or close
    vim.keymap.set("n", "<leader>e", function()
      local current_conf = vim.bo.filetype
      if current_conf == "oil" then
        -- If we are already in Oil, close it (go back to code)
        require("oil").close()
      else
        -- If we are in code, open the explorer
        require("oil").open()
      end
    end, { desc = "Toggle Oil File Explorer" })
  end,
}
