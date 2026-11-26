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
		-- cmd = { vim.fn.expand("$HOME/.local/share/asdf-vm/installs/golang/1.26.3/bin/gopls") },
	},
	clangd = {
    	cmd = {
            "clangd",
            "--query-driver=/nix/store/*/bin/clang*", -- or gcc
        },
  },

  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "E501" },
          },
        },
      },
    },
  },
	-- ts_ls = {},
	-- pyright = {},

}

vim.pack.add({
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
})

require("mason").setup({})


for server_name, config in pairs(servers) do
	vim.lsp.config(server_name, config)
end

require("mason-lspconfig").setup({
	automatic_enable = true,
})
