vim.pack.add { gh "rebelot/kanagawa.nvim" }
vim.pack.add { gh "folke/tokyonight.nvim" }
vim.pack.add { gh "rose-pine/neovim" }
vim.pack.add { gh "catppuccin/nvim" }

local ACTIVE_THEME = "tokyonight-moon"

require('kanagawa').setup({
    transparent = true,
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
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

-- Fire transparency components AFTER all plugins init
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "SnacksPickerTree", { bg = "none" })
    end,
})



vim.cmd.colorscheme (ACTIVE_THEME)
