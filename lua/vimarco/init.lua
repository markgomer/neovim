function gh(repo) return 'https://github.com/' .. repo end

require("vimarco.options")
require("vimarco.keymap")
require("vimarco.telescope")
require("vimarco.which-key")
require("vimarco.neotree")
require("vimarco.theme")

vim.g.have_nerd_font = true
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end


-- Highlight todo, notes, etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

