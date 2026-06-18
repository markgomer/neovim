function gh(repo) return 'https://github.com/' .. repo end

require("vimarco.options")
require("vimarco.keymap")
require("vimarco.theme")

require("vimarco.snacks")

require("vimarco.which-key")
require("vimarco.treesitter")
require("vimarco.lsp")
require("vimarco.blink")
require("vimarco.trouble")
require("vimarco.formatter")
require("vimarco.gitsigns")
require("vimarco.obsidian")
require("vimarco.transparent")
require("vimarco.vimpack")

vim.g.have_nerd_font = true
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

-- Highlight todo, notes, etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }
