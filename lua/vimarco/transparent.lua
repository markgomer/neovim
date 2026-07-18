-- https://github.com/xiyaowong/transparent.nvim
vim.pack.add({ gh("xiyaowong/transparent.nvim") })

require("transparent").setup({
	groups = {
		"Normal",
		"NormalNC",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
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
	},
	-- table: additional groups that should be cleared
	extra_groups = {
        "NormalFloat",
        "Float",
		"FloatBorder",
		"FloatTitle",
		"TablineFill",
        "StatusLineTerm",
        "MiniStatuslineFilename",
        "MiniStatuslineInactive"
    },                   
	-- table: groups you don't want to clear
	exclude_groups = {},

	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	-- on_clear = function()
	--        vim.cmd "TransparentEnable"
	--    end,
})

-- require('transparent').clear_prefix("MiniStatuslineFilename")
-- require('transparent').clear_prefix("MiniStatuslineInactive")
