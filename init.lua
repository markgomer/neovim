vim.loader.enable()

function gh(repo) return 'https://github.com/' .. repo end


vim.pack.add { gh 'nvim-tree/nvim-web-devicons' }

vim.pack.add({
    { src = gh "nvim-mini/mini.nvim", version = "stable" },
})

require("vimarco.options")
require("vimarco.keymap")
require("vimarco.theme")

require("vimarco.snacks")
require("vimarco.mini")

require("vimarco.which-key")
require("vimarco.treesitter")
require("vimarco.lsp")
require("vimarco.blink")
require("vimarco.trouble")
require("vimarco.formatter")
require("vimarco.gitsigns")
require("vimarco.obsidian")
require("vimarco.transparent")
require("vimarco.persistence")
require("vimarco.vimpack")
require("vimarco.debugger")
