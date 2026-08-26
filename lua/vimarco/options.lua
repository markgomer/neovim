vim.opt.hlsearch = false -- highlight search
vim.opt.colorcolumn = "80" -- the limit black bar
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.number = true -- line number
vim.o.relativenumber = true
vim.opt.cursorline = false

vim.opt.clipboard = ""

vim.o.scrolloff = 6

vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false -- Dont show mode since we have a statusline

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabulation
local tabstop = 4
vim.opt.tabstop = tabstop
vim.opt.softtabstop = tabstop
vim.opt.shiftwidth = tabstop
vim.opt.expandtab = true -- Use spaces instead of tabs by default

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dart",  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})
