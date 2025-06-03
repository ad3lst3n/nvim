return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting["google-java-format"],
				formatting.black,
				formatting.isort,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format({ bufnr = bufnr, async = true })
					end, { buffer = bufnr, noremap = true, silent = true, desc = "Format buffer with none-ls" })
				end
			end,
			debug = false,
		})
	end,
}
