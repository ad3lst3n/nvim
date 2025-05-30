return {
  {
    "williamboman/mason.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", {
      }, opts.servers and opts.servers.lua_ls or {}))

      lspconfig.jdtls.setup(vim.tbl_deep_extend("force", {
      }, opts.servers and opts.servers.jdtls or {}))

    end,
    keys = {
       { "K", vim.lsp.buf.hover, desc = "LSP Hover" },
       { "<leader>gd", vim.lsp.buf.definition, desc = "LSP Go to Definition" },
       { "<leader>gr", vim.lsp.buf.references, desc = "LSP Find References" },
       { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action" },
     },
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
          "flake8",
          "checkstyle",
        },
      })
    end,
  },
}