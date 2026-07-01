vim.pack.add({ "https://github.com/adithyasource/spearmint.nvim" })

require('spearmint').setup()

vim.keymap.set("n", "<leader>ms", function() Spearmint.set_mark() end, { desc = "Set mark"})

vim.keymap.set("n", "-", function() Spearmint.jump() end, { desc = "Jump to mark"})
vim.keymap.set("n", "<leader>m'", function() Spearmint.jump() end, { desc = "Jump to mark"})

vim.keymap.set("n", "<leader>md", function() Spearmint.delete_mark() end, { desc = "Delete mark"})
