print("HELLO FROM VIMARCO")

function gh(repo) return 'https://github.com/' .. repo end

require("vimarco.keymap")
require("vimarco.which-key")
require("vimarco.telescope")
require("vimarco.theme")

vim.g.have_nerd_font = true
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end
