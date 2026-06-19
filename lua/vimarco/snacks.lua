-- Highlight todo, notes, etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add { gh "folke/snacks.nvim" }

require("snacks").setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 4000,
    },
    picker = {
        enabled = true,
        ignored = true,
        hidden = true,
        win = {
            input = {
                keys = {
                    ["<Tab>"] = { "toggle_focus", mode = { "i", "n" } },
                }
            },
            list = {
                keys = {
                    ["<Tab>"] = { "toggle_focus", mode = { "i", "n" } },
                }
            }
        },
        sources = {
            -- explorer = {layout = {layout = {width = 25, min_width = 25}}},
            files = { hidden = true, ignored = false, },
            grep = { hidden = true, ignored = false, },
        },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
        notification = {
            wo = { wrap = true } -- Wrap notifications
        }
    },
})

local function setup_snacks_keys()
    local map = vim.keymap.set
    local s = Snacks

    -- Top Pickers
    map("n", "<leader><space>", function() s.picker.smart() end,          { desc = "Smart Find Files" })
    map("n", "<leader>,",       function() s.picker.buffers() end,        { desc = "Buffers" })
    map("n", "<leader>/",       function() s.picker.grep() end,           { desc = "Grep" })
    map("n", "<leader>:",       function() s.picker.command_history() end, { desc = "Command History" })
    map("n", "<leader>n",       function() s.picker.notifications() end,  { desc = "Notification History" })
    -- map("n", "<leader>e",       function() s.explorer() end,              { desc = "File Explorer" })

    -- Find
    map("n", "<leader>ff", function() s.picker.files() end,               { desc = "Find Files" })
    map("n", "<leader>fg", function() s.picker.git_files() end,           { desc = "Find Git Files" })
    map("n", "<leader>fr", function() s.picker.recent() end,              { desc = "Recent" })
    map("n", "<leader>fp", function() s.picker.projects() end,            { desc = "Projects" })
    map("n", "<leader>fb", function() s.picker.buffers() end,             { desc = "Buffers" })
    map("n", "<leader>fc", function() s.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })

    map("n", "<leader>gg", function() s.lazygit() end,               { desc = "Lazygit" })

    -- Grep / Search
    map("n", "<leader>sg",  function() s.picker.grep() end,             { desc = "Grep" })
    map({ "n", "x" }, "<leader>sw", function() s.picker.grep_word() end, { desc = "Visual selection or word" })
    map("n", "<leader>sb",  function() s.picker.lines() end,            { desc = "Buffer Lines" })
    map("n", "<leader>sB",  function() s.picker.grep_buffers() end,     { desc = "Grep Open Buffers" })
    map("n", '<leader>s"',  function() s.picker.registers() end,        { desc = "Registers" })
    map("n", '<leader>s/',  function() s.picker.search_history() end,   { desc = "Search History" })
    map("n", "<leader>sa",  function() s.picker.autocmds() end,         { desc = "Autocmds" })
    map("n", "<leader>sc",  function() s.picker.command_history() end,  { desc = "Command History" })
    map("n", "<leader>sC",  function() s.picker.commands() end,         { desc = "Commands" })
    map("n", "<leader>sd",  function() s.picker.diagnostics() end,      { desc = "Diagnostics" })
    map("n", "<leader>sD",  function() s.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
    map("n", "<leader>sh",  function() s.picker.help() end,             { desc = "Help Pages" })
    map("n", "<leader>sH",  function() s.picker.highlights() end,       { desc = "Highlights" })
    map("n", "<leader>si",  function() s.picker.icons() end,            { desc = "Icons" })
    map("n", "<leader>sj",  function() s.picker.jumps() end,            { desc = "Jumps" })
    map("n", "<leader>sk",  function() s.picker.keymaps() end,          { desc = "Keymaps" })
    map("n", "<leader>sl",  function() s.picker.loclist() end,          { desc = "Location List" })
    map("n", "<leader>sm",  function() s.picker.marks() end,            { desc = "Marks" })
    map("n", "<leader>sM",  function() s.picker.man() end,              { desc = "Man Pages" })
    map("n", "<leader>sq",  function() s.picker.qflist() end,           { desc = "Quickfix List" })
    map("n", "<leader>sR",  function() s.picker.resume() end,           { desc = "Resume" })
    map("n", "<leader>ss",  function() s.picker.lsp_symbols() end,      { desc = "LSP Symbols" })
    map("n", "<leader>sS",  function() s.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
    map("n", "<leader>su",  function() s.picker.undo() end,             { desc = "Undo History" })
    map("n", "<leader>uC",  function() s.picker.colorschemes() end,     { desc = "Colorschemes" })

    -- LSP
    map("n", "gd",  function() s.picker.lsp_definitions() end,     { desc = "Goto Definition" })
    map("n", "gD",  function() s.picker.lsp_declarations() end,    { desc = "Goto Declaration" })
    map("n", "gr",  function() s.picker.lsp_references() end,      { desc = "References", nowait = true })
    map("n", "gi",  function() s.picker.lsp_implementations() end, { desc = "Goto Implementation" })
    map("n", "gy",  function() s.picker.lsp_type_definitions() end,{ desc = "Goto T[y]pe Definition" })
    map("n", "gai", function() s.picker.lsp_incoming_calls() end,  { desc = "Calls Incoming" })
    map("n", "gao", function() s.picker.lsp_outgoing_calls() end,  { desc = "Calls Outgoing" })

    -- Other
    map("n", "<leader>z",  function() s.zen() end,                  { desc = "Toggle Zen Mode" })
    map("n", "<leader>Z",  function() s.zen.zoom() end,             { desc = "Toggle Zoom" })
    map("n", "<leader>.",  function() s.scratch() end,              { desc = "Toggle Scratch Buffer" })
    map("n", "<leader>S",  function() s.scratch.select() end,       { desc = "Select Scratch Buffer" })
    map("n", "<leader>bd", function() s.bufdelete() end,            { desc = "Delete Buffer" })
    map("n", "<leader>cR", function() s.rename.rename_file() end,   { desc = "Rename File" })
    map("n", "<leader>un", function() s.notifier.hide() end,        { desc = "Dismiss All Notifications" })
    map({ "n", "t" }, "<c-/>",  function() s.terminal() end,        { desc = "Toggle Terminal" })
    map({ "n", "t" }, "<c-_>",  function() s.terminal() end,        { desc = "which_key_ignore" })
    map({ "n", "t" }, "]]", function() s.words.jump(vim.v.count1) end,  { desc = "Next Reference" })
    map({ "n", "t" }, "[[", function() s.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
    map("n", "<leader>N", function()
        s.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6, height = 0.6,
            wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
        })
    end, { desc = "Neovim News" })

    s.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    s.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    s.toggle.diagnostics():map("<leader>ud")
    s.toggle.line_number():map("<leader>ul")
    s.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
    s.toggle.treesitter():map("<leader>uT")
    s.toggle.inlay_hints():map("<leader>uh")
    s.toggle.indent():map("<leader>ug")
    s.toggle.dim():map("<leader>uD")
end


init = function()
    local map = vim.keymap.set
    vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...)
                Snacks.debug.inspect(...)
            end
            _G.bt = function()
                Snacks.debug.backtrace()
            end

            -- Override print to use snacks for `:=` command
            if vim.fn.has("nvim-0.11") == 1 then
                vim._print = function(_, ...)
                    dd(...)
                end
            else
                vim.print = _G.dd
            end

            -- Create some toggle mappings
            Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
            Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
            Snacks.toggle.diagnostics():map("<leader>ud")
            Snacks.toggle.line_number():map("<leader>ul")
            Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
            Snacks.toggle.inlay_hints():map("<leader>uh")
            Snacks.toggle.indent():map("<leader>ug")
            Snacks.toggle.dim():map("<leader>uD")
        end,
    })
end




setup_snacks_keys()
