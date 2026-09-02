vim.loader.enable()

function gh(repo) return 'https://github.com/' .. repo end


vim.pack.add { gh 'nvim-tree/nvim-web-devicons' }

vim.pack.add({ gh 'nvim-mini/mini.nvim' })

require("vimarco.options")
require("vimarco.keymap")
require("vimarco.theme")

require("vimarco.snacks")

require("vimarco.which-key")
require("vimarco.treesitter")
require("vimarco.lsp")
require("vimarco.blink")
require("vimarco.trouble")
-- require("vimarco.statusline")
require("vimarco.bufferline")
require("vimarco.mini")
require("vimarco.formatter")
require("vimarco.gitsigns")
require("vimarco.obsidian")
require("vimarco.persistence")
require("vimarco.debugger")
require("vimarco.spearmint")
require("vimarco.yazi")
require("vimarco.transparent")
