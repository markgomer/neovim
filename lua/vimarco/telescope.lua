vim.pack.add({
    gh 'nvim-lua/plenary.nvim',
    gh 'nvim-telescope/telescope.nvim',
    gh 'nvim-telescope/telescope-ui-select.nvim',
    gh 'nvim-telescope/telescope-fzf-native.nvim'
})

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
    },
}

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Find Select Telescope' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by Grep' })
vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = 'Find Project Git Files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find Resume' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing buffers' })
vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = 'Find current Word' })


