return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- High performance C-based sorter
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      -- Load fzf extension for HFT-speed searching
      telescope.load_extension("fzf")

      -- KEYMAPS
      local keymap = vim.keymap.set
      
      -- Core Search
      keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep Text" })
      keymap("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
      
      -- The NvChad-style Theme Selector
      keymap("n", "<leader>th", function()
        builtin.colorscheme({ enable_preview = true })
      end, { desc = "Theme Selector with Preview" })
      
      -- Resume last search (extremely useful for deep C++ debugging)
      keymap("n", "<leader>fr", builtin.resume, { desc = "Resume Last Search" })
    end,
  },
}
