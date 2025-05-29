-- ~/.config/nvim/lua/plugins/devicons.lua
return {
  'nvim-tree/nvim-web-devicons', -- The plugin's GitHub repository
  config = function()
    -- This function will be called automatically after the plugin is loaded
    require('nvim-web-devicons').setup({
      default = true, -- Enable default icons
      -- You can add more configuration options here if needed
      -- e.g., override = {
      --   git = {
      --     icon = "",
      --     color = "#F14E32",
      --     name = "Git",
      --   },
      -- },
    })
  end,
}