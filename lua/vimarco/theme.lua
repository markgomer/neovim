vim.pack.add { gh "rebelot/kanagawa.nvim" }

require('kanagawa').setup {
    transparent = true,
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
}

require("kanagawa").load()
