vim.pack.add({ gh("folke/tokyonight.nvim") })

-- local ACTIVE_THEME = "base16-kanagawa"

require("tokyonight").setup({
	transparent = true,
	style = "moon",
	styles = {
		sidebars = "transparent",
		floats = "transparent",
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
	on_highlights = function(hl, _)
        -- yellowish
		-- hl["@variable"] = { fg = "#f7e9d1" }
		-- hl["@tag.tsx"] = { fg = "#f7e9d1" }
		hl["@markup.strong.markdown_inline"] = { fg = "#F090E0" }
	end,
})
-- vim.cmd.colorscheme(ACTIVE_THEME)
