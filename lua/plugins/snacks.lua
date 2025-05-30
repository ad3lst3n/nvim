-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      -- We need to directly override the 'preset' for the dashboard,
      -- specifically its 'header' field.
      dashboard = {
        preset = {
          -- This is the crucial part: replace LazyVim's default header here.
          -- Use a single long string literal for your logo, just like LazyVim's default does.
          -- Ensure no extra [[ ]] or commas inside the main block.
          header = [[                                                                       
                                                                             
                                                                             
                                                                             
                                                                           
             ████ ██████           █████      ██                     
            ███████████             █████                             
            █████████ ███████████████████ ███   ███████████   
           █████████  ███    █████████████ █████ ██████████████   
          █████████ ██████████ █████████ █████ █████ ████ █████   
        ███████████ ███    ███ █████████ █████ █████ ████ █████  
       ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                             
                                                                             
                                                                             ]],

          -- You can also override the default keys in the preset here if you want.
          -- For example, if you want different keys:
          -- keys = {
          --   { icon = "🚀 ", key = "f", desc = "My Find", action = ":lua Snacks.dashboard.pick('files')" },
          -- },
          -- If you comment out the 'keys' section above, LazyVim's default keys will apply.
        },
        -- Hide other sections if you want only your logo to show, or customize them as needed.
        --sections = {
        --  buttons = false, -- Default buttons from LazyVim's snacks.nvim
        --  recent_files = false,
          -- etc.
        },
      },
    },
  }
