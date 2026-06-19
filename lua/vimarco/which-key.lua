-- Useful plugin to show you pending keybinds.
vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    -- Document existing key chains
    spec = {
        { '<leader>s', group = 'Search', mode = { 'n', 'v' } },
        { '<leader>c', group = 'Code', mode = { 'n', 'v' } },
        { '<leader>f', group = 'Find', mode = { 'n', 'v' } },
        { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
        { '<leader>m', group = 'Marks', mode = { 'n', 'v' } },
        { '<leader>q', group = 'Session', mode = { 'n' } },
        { '<leader>u', group = 'UI', mode = { 'n', 'v' } },
        { '<leader>x', group = 'Trouble', mode = { 'n' } },
        -- { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
}

