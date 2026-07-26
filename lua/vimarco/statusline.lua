local function update_git_branch()
    local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
    vim.b.git_branch = branch ~= "" and ("  " .. branch .. " ") or ""
end

local function update_git_diff()
    local gs = vim.b.gitsigns_status_dict
    if not gs then
        vim.b.git_diff_cache = ""
        return
    end

    local str = ""
    if (gs.added or 0) > 0 then str = str .. " +" .. gs.added end
    if (gs.changed or 0) > 0 then str = str .. " ~" .. gs.changed end
    if (gs.removed or 0) > 0 then str = str .. " -" .. gs.removed end

    vim.b.git_diff_cache = str ~= "" and (str .. " ") or ""
end

local function update_diagnostics()
    local count = function(severity)
        return #vim.diagnostic.get(0, { severity = severity })
    end

    local errs  = count(vim.diagnostic.severity.ERROR)
    local warns = count(vim.diagnostic.severity.WARN)
    local hints = count(vim.diagnostic.severity.HINT)
    local info  = count(vim.diagnostic.severity.INFO)

    local res = ""
    if errs > 0 then res = res .. "  " .. errs end
    if warns > 0 then res = res .. "  " .. warns end
    if hints > 0 then res = res .. " 󰌵 " .. hints end
    if info  > 0 then res = res .. "  " .. info end

    vim.b.lsp_diag_cache = res ~= "" and (res .. " ") or ""
end

-- AUTOCOMMANDS
local group = vim.api.nvim_create_augroup("StatuslineUpdates", { clear = true })

-- Update git branch on buffer enter / focus
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "BufWritePost" }, {
    group = group,
    callback = update_git_branch,
})

-- Update git diff only when gitsigns updates its status
vim.api.nvim_create_autocmd({ "User" }, {
    group = group,
    pattern = "GitSignsUpdate",
    callback = update_git_diff,
})

-- Update LSP counts ONLY when diagnostics change or buffer changes
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
    group = group,
    callback = update_diagnostics,
})

_G.git_branch      = function() return vim.b.git_branch or "" end
_G.git_diff        = function() return vim.b.git_diff_cache or "" end
_G.lsp_diagnostics = function() return vim.b.lsp_diag_cache or "" end

vim.opt.statusline = table.concat({
    " %{%expand('%:p:h:t')%}/%t",   -- Folder / Filename
    "%{%v:lua.git_diff()%}",        -- Cached Git diff
    " %m%r",                        -- Modified / Read-only flags
    "%=",                           -- Right-align split point
    "%{%v:lua.git_branch()%}",      -- Cached Git branch
    "%{%v:lua.lsp_diagnostics()%}", -- Cached LSP diagnostics
    -- " %l/%L:%c ",                   -- Line / Total lines : Column
}, "")
