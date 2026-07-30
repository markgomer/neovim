-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
-- vim.pack.add(gh 'mini.statusline')

local statusline = require("mini.statusline")

statusline.setup({
    use_icons = true,
    content = {
        active = function()
            -- Match: " %{%expand('%:p:h:t')%}/%t"
            local path = vim.fn.expand("%:p:h:t")
            local file = vim.fn.expand("%:t")
            local file_str = "" .. (path ~= "" and path .. "/" or "") .. (file ~= "" and file or "[No Name]")

            -- Match: "%m%r"
            local mod = vim.bo.modified and "[+]" or ""
            local ro = vim.bo.readonly and "[RO]" or ""
            local flags = (mod .. ro) ~= "" and ("" .. mod .. ro) or ""

            -- Retrieve cached values
            -- local diff   = vim.b.git_diff_cache or ""
            -- local diag   = vim.b.lsp_diag_cache or ""
            -- local branch = vim.b.git_branch or ""

            -- DEFAULtS
            -- local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diag = MiniStatusline.section_diagnostics({
                trunc_width = 75,
                signs = {
                    ERROR = " ", WARN  = " ", HINT  = " ", INFO  = " ",
                },
            })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
                { hl = "MiniStatuslineFilename", strings = {
                    file_str, diff, flags }
                },
                "%=", -- Correct right-align split
                { hl = "MiniStatuslineinfo", strings = { diag } },
                { hl = "MiniStatuslineFilename", strings = { git } },
            })
        end,
    },
})
