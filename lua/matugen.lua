 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a2223',
    base01 = '#2c383a',
    base02 = '#273235',
    base03 = '#606d70',
    base04 = '#afb5b6',
    base05 = '#f2f3f3',
    base06 = '#f2f3f3',
    base07 = '#f2f3f3',
    base08 = '#fd4663',
    base09 = '#a7a2c1',
    base0A = '#9faac4',
    base0B = '#9ac1c9',
    base0C = '#b4afd0',
    base0D = '#acccd3',
    base0E = '#afb9d0',
    base0F = '#cdd4e4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f3f3',          bg = '#1a2223' })
  hi('TelescopeBorder',         { fg = '#606d70',             bg = '#1a2223' })
  hi('TelescopePromptNormal',   { fg = '#f2f3f3',          bg = '#1a2223' })
  hi('TelescopePromptBorder',   { fg = '#606d70',             bg = '#1a2223' })
  hi('TelescopePromptPrefix',   { fg = '#9ac1c9',             bg = '#1a2223' })
  hi('TelescopePromptCounter',  { fg = '#afb5b6',  bg = '#1a2223' })
  hi('TelescopePromptTitle',    { fg = '#1a2223',             bg = '#9ac1c9' })
  hi('TelescopePreviewTitle',   { fg = '#1a2223',             bg = '#9faac4' })
  hi('TelescopeResultsTitle',   { fg = '#1a2223',             bg = '#a7a2c1' })
  hi('TelescopeSelection',      { fg = '#f2f3f3',          bg = '#273235' })
  hi('TelescopeSelectionCaret', { fg = '#9ac1c9',             bg = '#273235' })
  hi('TelescopeMatching',       { fg = '#9ac1c9',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f3f3',          bg = '#1a2223' })
  hi('MiniPickBorder',         { fg = '#606d70',             bg = '#1a2223' })
  hi('MiniPickPrompt',   { fg = '#f2f3f3',          bg = '#1a2223' })
  hi('MiniPickPromptPrefix',   { fg = '#9ac1c9',             bg = '#1a2223' })
  hi('MiniPickBorderText',    { fg = '#1a2223',             bg = '#9ac1c9' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f3f3',          bg = '#273235' })
  hi('MiniPickPromptCaret', { fg = '#9ac1c9',             bg = '#273235' })
  hi('MiniPickMatchRanges',       { fg = '#9ac1c9',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
