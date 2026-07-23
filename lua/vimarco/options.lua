vim.opt.hlsearch = false -- highlight search
vim.opt.colorcolumn = "80" -- the limit black bar
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.number = true -- line number
vim.o.relativenumber = false
vim.opt.cursorline = false

vim.opt.clipboard = ""

-- Tabulation
local tabstop = 4
vim.opt.tabstop = tabstop
vim.opt.softtabstop = tabstop
vim.opt.shiftwidth = tabstop
vim.opt.expandtab = true -- Use spaces instead of tabs by default

vim.o.scrolloff = 6

vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false -- Dont show mode since we have a statusline

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true


-- STATUS LINE

local function git_branch()
    local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
    return branch ~= "" and ("  " .. branch .. " ") or ""
end

-- Make the function accessible to statusline's %{} syntax
_G.git_branch = git_branch

local statusline = {
    "%{%expand('%:p:h:t')%}/",  -- folder above
    "%t",                       -- File name
    " %m%r",                    -- Modified/Read-only indicator
    " %{%v:lua.git_branch()%}", -- git branch
    "%=",                       -- Separation point (align right)
    " %l/%L:%c "                -- Current/Total lines : Column
}

vim.opt.statusline = table.concat(statusline, "")
