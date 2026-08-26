-- Useful status updates for LSP.
vim.pack.add({ gh("j-hui/fidget.nvim") })
require("fidget").setup({})

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`)
--    this function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })

		-- HIGHLIGHT references for the token below cursor
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({
						group = "lsp-highlight",
						buffer = event2.buf,
					})
				end,
			})
		end
	end,
})

-- Enable the following language servers.
-- These are NOT auto-installed — install manually via :MasonInstall <name>
-- (clangd is the exception; see mason-tool-installer block below).
---@type table<string, vim.lsp.Config>
local servers = {
	gopls = {
		-- Explicit path avoids PATH/shim ambiguity between asdf and Mason.
		-- Update this if you bump your asdf golang version.
		cmd = { vim.fn.expand("$HOME/.local/share/asdf-vm/installs/golang/1.26.3/bin/gopls") },
	},
	clangd = {},
	-- ts_ls = {},
	-- pyright = {},

	-- Special Lua Config, as recommended by neovim help docs
	-- lua_ls = {
	-- 	on_init = function(client)
	-- 		client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)
	--
	-- 		if client.workspace_folders then
	-- 			local path = client.workspace_folders[1].name
	-- 			if
	-- 			    path ~= vim.fn.stdpath("config")
	-- 				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
	-- 			then
	-- 				return
	-- 			end
	-- 		end
	--
	-- 		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
	-- 			runtime = {
	-- 				version = "LuaJIT",
	-- 				path = { "lua/?.lua", "lua/?/init.lua" },
	-- 			},
	-- 			workspace = {
	-- 				checkThirdParty = false,
	-- 				-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
	-- 				--  See https://github.com/neovim/nvim-lspconfig/issues/3189
	-- 				library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
	-- 					"${3rd}/luv/library",
	-- 					"${3rd}/busted/library",
	-- 				}),
	-- 			},
	-- 		})
	-- 	end,
	-- 	---@type lspconfig.settings.lua_ls
	-- 	settings = {
	-- 		Lua = {
	-- 			format = { enable = false }, -- Disable formatting (formatting is done by stylua)
	-- 		},
	-- 	},
	-- },
}

vim.pack.add({
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
})

require("mason").setup({})

-- No ensure_installed here: every LSP in `servers` is installed manually
-- via :MasonInstall <name>. Auto-install was the root cause of a corrupted
-- gopls binary (install got killed mid-write by an unrelated nvim restart).
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			-- Only setup and enable servers explicitly listed in the `servers` table
			if servers[server_name] then
				vim.lsp.config(server_name, servers[server_name])
				vim.lsp.enable(server_name)
			end
		end,
	},
})

-- Non-LSP tools you DO want auto-installed/kept up to date.
-- stylua is a formatter, not an LSP server, so it can't go through
-- mason-lspconfig above — it needs mason-tool-installer instead.
require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "clangd" },
})
