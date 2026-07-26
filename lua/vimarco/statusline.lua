local function git_diff()
  local gs = vim.b.gitsigns_status_dict
  if not gs then return "" end

  local str = ""
  if (gs.added or 0) > 0 then str = str .. " +" .. gs.added end
  if (gs.changed or 0) > 0 then str = str .. " ~" .. gs.changed end
  if (gs.removed or 0) > 0 then str = str .. " -" .. gs.removed end

  return str ~= "" and (str .. " ") or ""
end

_G.git_diff = git_diff

local function update_git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
  vim.b.git_branch = branch ~= "" and ("  " .. branch .. " ") or ""
end

-- Update branch only on relevant buffer/file events
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "BufWritePost" }, {
  callback = update_git_branch,
})

-- Retrieve cached buffer variable instantly
local function git_branch()
  return vim.b.git_branch or ""
end

_G.git_branch = git_branch

-- DIAGNOSTICS
local function lsp_diagnostics()
  local count = function(severity)
    return #vim.diagnostic.get(0, { severity = severity })
  end

  local errs = count(vim.diagnostic.severity.ERROR)
  local warns = count(vim.diagnostic.severity.WARN)
  local hints = count(vim.diagnostic.severity.HINT)
  local info  = count(vim.diagnostic.severity.INFO)

  local res = ""
  if errs > 0 then res = res .. "  " .. errs end
  if warns > 0 then res = res .. "  " .. warns end
  if hints > 0 then res = res .. " 󰌵 " .. hints end
  if info  > 0 then res = res .. "  " .. info end
  -- res = res .. "  " .. errs 
  -- res = res .. "  " .. warns
  -- res = res .. " 󰌵 " .. hints
  -- res = res .. "  " .. info 

  return res ~= "" and (res .. " ") or ""
end

_G.lsp_diagnostics = lsp_diagnostics

-- STATUS LINE FORMAT
local statusline = {
    "  %{%expand('%:p:h:t')%}/%t", -- folder + filename
    "%=", -- to the right now
    -- "%m%r ", -- file modified sign
    -- "%l/%L:%c", -- row/col number 
    " %{%v:lua.lsp_diagnostics()%}", -- diagnostics
    " %{%v:lua.git_branch()%}",
    "|%{%v:lua.git_diff()%}",
}

vim.opt.statusline = table.concat(statusline, "")
