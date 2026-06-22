-- https://github.com/xiyaowong/transparent.nvim
vim.pack.add({ gh("xiyaowong/transparent.nvim") })

require("transparent").setup({
	groups = {
		"Normal",
		"NormalNC",
		"NormalFloat",
        "Float",
		"FloatBorder",
		"FloatTitle",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
		"TablineFill",
	},
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "none" })
