vim.pack.add { gh 'nvim-tree/nvim-web-devicons' }
vim.pack.add { gh "akinsho/bufferline.nvim" }

require("bufferline").setup{
    options = {
        numbers = "ordinal",
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        sort_by = 'insert_at_end',
        pick = {
            alphabet = "1234567890ABCDEF",
        },
    }
}

vim.keymap.set("n", "<leader>p", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
vim.keymap.set("n", "<S-H>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Left buffer" })
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
vim.keymap.set("n", "<S-L>", "<cmd>BufferLineCycleNext<cr>", { desc = "Right buffer" })
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>p", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })

vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
