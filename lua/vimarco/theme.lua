vim.pack.add({ gh("rebelot/kanagawa.nvim") })
vim.pack.add({ gh("folke/tokyonight.nvim") })
vim.pack.add({ gh("rose-pine/neovim") })
vim.pack.add({ gh("catppuccin/nvim") })
vim.pack.add({ gh("ellisonleao/gruvbox.nvim") })

local ACTIVE_THEME = "kanagawa"

require("kanagawa").setup({
    terminalColors = true,
	transparent = true,
	commentStyle = { italic = true },
	functionStyle = { },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
    typeStyle = { italic = true },
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

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
		hl["@variable"] = { fg = "#F090E0" }
		hl["@tag.tsx"] = { fg = "#F090E0" }
		hl["@markup.strong.markdown_inline"] = { fg = "#F090E0" }
	end,
})

require("rose-pine").setup({
	variant = "moon", -- auto, main, moon, or dawn
	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},
})

require("catppuccin").setup({
	flavour = "auto", -- auto, latte, frappe, macchiato, mocha
	transparent_background = true,
	float = {
		transparent = true, -- enable transparent floating windows
		solid = false, -- use solid styling for floating windows, see |winborder|
	},
	lsp_styles = {
		underlines = {
			errors = { "undercurl" },
			hints = { "undercurl" },
			warnings = { "undercurl" },
			information = { "undercurl" },
		},
	},
	integrations = {
		aerial = true,
		alpha = true,
		cmp = true,
		dashboard = true,
		flash = true,
		fzf = true,
		grug_far = true,
		gitsigns = true,
		headlines = true,
		illuminate = true,
		indent_blankline = { enabled = true },
		leap = true,
		lsp_trouble = true,
		mason = true,
		mini = true,
		navic = { enabled = true, custom_bg = "lualine" },
		neotest = true,
		neotree = true,
		noice = true,
		notify = true,
		snacks = true,
		telescope = true,
		treesitter_context = true,
		which_key = true,
	},
})

require("gruvbox").setup({
	transparent_mode = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	overrides = {
		-- ["@markup.strong.markdown_inline"] = { fg = "#FF9900" },
		-- ["@lsp.type.method"] = { fg = "#ff9900" },
		-- ["@comment.lua"] = { fg = "#000000" },
	},
})

vim.cmd.colorscheme(ACTIVE_THEME)
