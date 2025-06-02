return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer events
	dependencies = { "nvim-lua/plenary.nvim" }, -- Often useful, though not strictly required by none-ls core
	config = function()
		local none_ls = require("none-ls") -- Use require("none-ls")

		local formatting = none_ls.builtins.formatting
		-- local diagnostics = none_ls.builtins.diagnostics -- For linters, if you add them here

		none_ls.setup({
			sources = {
				formatting.stylua,
				formatting["google-java-format"],
				formatting.black,
				formatting.isort,
			},
			-- Optional: on_attach for buffer-local keymaps and other buffer-specific setup
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format({ bufnr = bufnr, async = true })
					end, { buffer = bufnr, noremap = true, silent = true, desc = "Format buffer with none-ls" })
				end

				-- Example for range formatting if needed
				-- if client.supports_method("textDocument/rangeFormatting") then
				--   vim.keymap.set("x", "<leader>gf", function()
				--     vim.lsp.buf.format({ bufnr = bufnr, async = true })
				--   end, { buffer = bufnr, noremap = true, silent = true, desc = "Format selection with none-ls" })
				-- end
			end,
			debug = false, -- Set to true if you need to troubleshoot none-ls
		})
	end,
}
