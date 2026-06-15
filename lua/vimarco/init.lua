function gh(repo) return 'https://github.com/' .. repo end

require("vimarco.options")
require("vimarco.keymap")
require("vimarco.vimpack")
require("vimarco.snacks")
require("vimarco.theme")
require("vimarco.which-key")
require("vimarco.treesitter")
require("vimarco.lsp")
require("vimarco.blink")
require("vimarco.gitsigns")
require("vimarco.bufferline")
require("vimarco.formatter")
require("vimarco.obsidian")

vim.g.have_nerd_font = true
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

-- Highlight todo, notes, etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }
