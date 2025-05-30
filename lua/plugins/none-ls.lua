return {
	"nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")

    opts.sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting["google_java_format"],
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.flake8,
    }

    -- If you wanted to *add* to LazyVim's default sources:
    -- opts.sources = vim.list_extend(opts.sources or {}, {
    --   null_ls.builtins.formatting.stylua,
    --   -- etc.
    -- })

    return opts
  end,
  config = function(_, opts)
    require("null-ls").setup(opts)

  end,
  keys = {
   { "<leader>gf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format (None-LS)" },
  },
}