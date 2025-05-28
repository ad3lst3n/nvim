local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("options")
require("plugins.colorscheme")
require("lazy").setup("plugins")

vim.diagnostic.config({
  virtual_text = true,

  signs = true,
  underline = true,
  update_in_insert = true,
  float = {
    source = "always",
    border = "single",
  },
  -- Severity-based configuration
  severity_sort = true,
})
