-- ~/.config/nvim/lua/plugins/aerial.lua
return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { '<leader>a', '<cmd>AerialToggle<cr>', desc = 'Toggle Aerial' },
  },
}