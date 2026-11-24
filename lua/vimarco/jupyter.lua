vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.exepath("python3")

vim.pack.add({ "https://github.com/benlubas/molten-nvim" })
vim.pack.add({ "https://github.com/GCBallesteros/jupytext.nvim" })

require("jupytext").setup({
  style = "hydrogen",
  output_extension = "py",
  force_ft = "python",
})

vim.keymap.set("n", "<leader>jc", function()
  local s = vim.fn.search("^# %%", "bcnW")
  local e = vim.fn.search("^# %%", "nW")
  local first = (s == 0) and 1 or s + 1
  local last = (e == 0) and vim.fn.line("$") or e - 1
  local seq = ("%dGV%dG:<C-u>MoltenEvaluateVisual<CR>"):format(first, last)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(seq, true, false, true), "nx", false)
end, { desc = "Evaluate # %% cell" })

vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>")
vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>")
vim.keymap.set("v", "<leader>j", ":<C-u>MoltenEvaluateVisual<CR>gv")
vim.keymap.set("n", "<leader>jr", ":MoltenReevaluateCell<CR>")
