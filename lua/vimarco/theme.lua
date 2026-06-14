vim.pack.add { gh "rebelot/kanagawa.nvim" }
vim.pack.add { gh "folke/tokyonight.nvim" }
vim.pack.add { gh "rose-pine/neovim" }

vim.cmd.colorscheme 'tokyonight-moon'

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
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
    },
    on_highlights = function(hl, _)
        hl["@variable"] = { fg = "#F050F0" }
        hl["@tag.tsx"] = { fg = "#F050F0" }
        -- hl["@variable.builtin"]   = { fg = dark_red }
        -- hl["@variable.member"]    = { fg = dark_red }
        -- hl["@variable.parameter"] = { fg = dark_red }
        -- hl["Identifier"]          = { fg = dark_red }
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


-- Fire transparency components AFTER all plugins init
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
    end,
})

