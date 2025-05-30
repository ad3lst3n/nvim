local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      -- Add/modify the 'opts' table to include your desired extras
      opts = {
        extras = {
          "lazyvim.plugins.extras.lang.java",   -- Enable Java language server defaults
          "lazyvim.plugins.extras.lang.python",  -- Enable Python language server defaults
          "lazyvim.plugins.extras.coding.format", -- Enable LazyVim's default formatting integration
          "lazyvim.plugins.extras.coding.lint",   -- Enable LazyVim's default linting integration
          "lazyvim.plugins.extras.lsp.none-ls",
          "lazyvim.plugins.extras.ai.copilot",
          "lazyvim.plugins.extras.coding.yanky",
          "lazyvim.plugins.extras.editor.dial",
          "lazyvim.plugins.extras.editor.inc-rename",
          "lazyvim.plugins.extras.test.core",
          "lazyvim.plugins.extras.util.mini-hipatterns",
        },
      },
    },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})