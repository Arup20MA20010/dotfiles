require "globals"
require "competitest_additional_config"

vim.cmd [[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch",timeout = 80})
augroup END
]]

-- wrap git commit body message lines at 72 characters
vim.cmd [["
    augroup gitsetup
        autocmd!
        autocmd FileType gitcommit
                \ autocmd CursorMoved,CursorMovedI * 
                        \ let &l:textwidth = line('.') == 1 ? 50 : 72
augroup end
"]]

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 5)
end)
