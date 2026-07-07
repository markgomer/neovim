vim.pack.add { gh "folke/trouble.nvim" }

require("trouble").setup({
    modes = {
        diagnostics = { -- or any other mode name
            win = {
                wo = {
                    wrap = true,
                },
            },
        },
    },
})

-- DIAGNOSTICS
vim.diagnostic.config({
    virtual_text = false, -- This puts diagnostic inline with code
    virtual_lines = false,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "󰌵",
            [vim.diagnostic.severity.INFO]  = "",
        },
    }
})

vim.keymap.set('n', '<leader>xl', function()
    local current = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = not current })
end, { desc = "Toggle diagnostic virtual lines" })

vim.keymap.set(
    "n",
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<cr>",
    { desc = "Diagnostics (Trouble)" }
)
vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    { desc = "Symbols (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>xL",
    "<cmd>Trouble loclist toggle<cr>",
    { desc = "Location List (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>xQ",
    "<cmd>Trouble qflist toggle<cr>",
    { desc = "Quickfix List (Trouble)" }
)
