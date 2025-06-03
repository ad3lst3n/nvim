return {
	{
		"williamboman/mason.nvim",
		lazy = false, -- Or true with cmd = "Mason" or event = "VeryLazy"
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- For capabilities
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach_common(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
				end

				-- Standard LSP keymaps (buffer-local)
				map("n", "K", vim.lsp.buf.hover, "LSP Hover")
				map("n", "<leader>gd", vim.lsp.buf.definition, "LSP Go to Definition")
				map("n", "gD", vim.lsp.buf.declaration, "LSP Go to Declaration")
				map("n", "<leader>gi", vim.lsp.buf.implementation, "LSP Go to Implementation")
				map("n", "<leader>gr", vim.lsp.buf.references, "LSP Go to References")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
				map("v", "<leader>ca", vim.lsp.buf.code_action, "LSP Code Action (Visual)")
				map("n", "<leader>rn", vim.lsp.buf.rename, "LSP Rename")
				-- Your <leader>gf is for null-ls formatting, which is good.
				-- If you want a specific LSP format key:
				-- map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "LSP Format Document")

				-- Diagnostic keymaps
				map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
				map("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", "List Diagnostics")

				-- Highlight symbol under cursor
				if client.supports_method("textDocument/documentHighlight") then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = bufnr,
						group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true }),
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd("CursorMoved", {
						buffer = bufnr,
						group = vim.api.nvim_create_augroup("LspClearHighlight", { clear = true }),
						callback = vim.lsp.buf.clear_references, -- Clears document highlights
					})
				end

				print("LSP client attached: " .. client.name .. " to buffer " .. bufnr)
			end

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls" },
				handlers = {
					-- Default handler for LSP servers
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach_common,
						})
					end,
					-- Specific handler for lua_ls
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							on_attach = on_attach_common,
							settings = {
								Lua = {
									runtime = { version = "LuaJIT" },
									diagnostics = { globals = { "vim" } },
									workspace = {
										library = vim.api.nvim_get_runtime_file("", true),
										checkThirdParty = false, -- Important for performance with plugins like lazy.nvim
									},
									telemetry = { enable = false },
								},
							},
						})
					end,
					-- Specific handler for jdtls
					["jdtls"] = function()
						require("lspconfig").jdtls.setup({
							capabilities = capabilities,
							on_attach = on_attach_common,
							-- Add any jdtls specific configurations here if needed
							-- e.g., cmd, root_dir, init_options for lombok, project settings etc.
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false, -- Or true with event = "VeryLazy" or "LspAttach"
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- Server setups and keymaps are now primarily handled by mason-lspconfig and on_attach.
			-- This space can be used for global LSP settings or diagnostics customization
			-- if not handled elsewhere (e.g., in init.lua or by your colorscheme).

			-- Example: Define custom diagnostic signs (your init.lua already configures diagnostics well)
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"black",
					"isort",
					"google-java-format",
					"checkstyle", -- For nvim-lint java linting
				},
				-- auto_update = true, -- Consider enabling if you want tools to auto-update
			})
		end,
	},
}
