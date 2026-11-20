 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0b0e14',
    base01 = '#1e222a',
    base02 = '#272c36',
    base03 = '#595f6a',
    base04 = '#8e959e',
    base05 = '#d1d1c7',
    base06 = '#d1d1c7',
    base07 = '#d1d1c7',
    base08 = '#d95757',
    base09 = '#e6b450',
    base0A = '#aad94c',
    base0B = '#39bae6',
    base0C = '#efcf8f',
    base0D = '#8ed8f1',
    base0E = '#cde996',
    base0F = '#e2f4be',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('TelescopeBorder',         { fg = '#595f6a',             bg = '#0b0e14' })
  hi('TelescopePromptNormal',   { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('TelescopePromptBorder',   { fg = '#595f6a',             bg = '#0b0e14' })
  hi('TelescopePromptPrefix',   { fg = '#39bae6',             bg = '#0b0e14' })
  hi('TelescopePromptCounter',  { fg = '#8e959e',  bg = '#0b0e14' })
  hi('TelescopePromptTitle',    { fg = '#0b0e14',             bg = '#39bae6' })
  hi('TelescopePreviewTitle',   { fg = '#0b0e14',             bg = '#aad94c' })
  hi('TelescopeResultsTitle',   { fg = '#0b0e14',             bg = '#e6b450' })
  hi('TelescopeSelection',      { fg = '#d1d1c7',          bg = '#272c36' })
  hi('TelescopeSelectionCaret', { fg = '#39bae6',             bg = '#272c36' })
  hi('TelescopeMatching',       { fg = '#39bae6',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('MiniPickBorder',         { fg = '#595f6a',             bg = '#0b0e14' })
  hi('MiniPickPrompt',   { fg = '#d1d1c7',          bg = '#0b0e14' })
  hi('MiniPickPromptPrefix',   { fg = '#39bae6',             bg = '#0b0e14' })
  hi('MiniPickBorderText',    { fg = '#0b0e14',             bg = '#39bae6' })
  hi('MiniPickMatchCurrent',      { fg = '#d1d1c7',          bg = '#272c36' })
  hi('MiniPickPromptCaret', { fg = '#39bae6',             bg = '#272c36' })
  hi('MiniPickMatchRanges',       { fg = '#39bae6',             bold = true })
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
