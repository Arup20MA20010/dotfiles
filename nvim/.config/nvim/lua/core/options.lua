local opt = vim.opt

opt.number = true           -- Line numbers
opt.relativenumber = true   -- Essential for fast jumping
opt.shiftwidth = 4          -- Standard for C++/HFT
opt.tabstop = 4
opt.expandtab = true        -- Spaces > Tabs
opt.smartindent = true
opt.termguicolors = true    -- True color support
opt.updatetime = 50         -- Faster completion (HFT speed!)
opt.cursorline = true       -- Highlight current line
opt.signcolumn = "yes"      -- Always show the gutter to prevent "jumping"
opt.swapfile = false        -- We trust our git and memory
