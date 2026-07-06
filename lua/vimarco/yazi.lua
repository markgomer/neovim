vim.pack.add({
	gh("nvim-lua/plenary.nvim"),
	gh("mikavilpas/yazi.nvim"),
})

require("yazi").setup({
    open_for_directories = false,
})


vim.keymap.set("n", "<leader>e", function()
	require("yazi").yazi()
end)

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})
