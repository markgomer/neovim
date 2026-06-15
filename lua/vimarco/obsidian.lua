vim.pack.add { gh "obsidian-nvim/obsidian.nvim" }

require("obsidian").setup {
    version = "*", -- use latest release, remove to use latest commit
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
        {
            name = "obsidian",
            path = "~/Documents/Obsidian",
        },
    },
    picker = {
        name = "snacks.picker",
    },
}
