vim.opt.hlsearch = false -- highlight search
vim.opt.colorcolumn = "80" -- the limit black bar
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.number = true -- line number
vim.o.relativenumber = true
vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.clipboard = ""

-- Tabulation
local tabstop = 4
vim.opt.tabstop = tabstop
vim.opt.softtabstop = tabstop
vim.opt.shiftwidth = tabstop
vim.opt.expandtab = true -- Use spaces instead of tabs by default

vim.o.scrolloff = 10

vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false -- Dont show mode since we have a statusline

vim.opt.termguicolors = true

-- DIAGNOSTICS
-- Change text/icon inside sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = true, -- This puts diagnostic inline with code
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ", -- Change to icon you like
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌵 ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
    }
})
