vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.exepath("python3")

vim.pack.add({ "https://github.com/benlubas/molten-nvim" })
vim.pack.add({ "https://github.com/GCBallesteros/jupytext.nvim" })

require("jupytext").setup({
  style = "hydrogen",
  output_extension = "py",
  force_ft = "python",
})

vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>")
vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>")
