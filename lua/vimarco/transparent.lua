-- https://github.com/xiyaowong/transparent.nvim
vim.pack.add({ gh("xiyaowong/transparent.nvim") })

-- Optional, you don't have to run setup.
require("transparent").setup({
	-- table: default groups
	groups = {
		"Normal", "NormalNC", "NormalFloat", "FloatBorder", "FloatTitle",
		"Comment", "Constant", "Special", "Identifier", "Statement", "PreProc",
		"Type", "Underlined", "Todo", "String", "Function", "Conditional",
		"Repeat", "Operator", "Structure", "LineNr", "NonText", "SignColumn",
		"StatusLine", "StatusLineNC", "EndOfBuffer", "TablineFill",
    },
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = { "TabLineSel" },
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})

-- require('transparent').clear_prefix('BufferLine')
-- require 'transparent'.clear_prefix("TabLine")
-- require 'transparent'.clear_prefix("SnacksPicker")
