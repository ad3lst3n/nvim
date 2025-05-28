return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "dracula",
    },
    sections = {
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        "location",
        {
          "diagnostics",
          -- Displays errors, warnings, info, hints counts
          sources = { "nvim_diagnostic" }, -- Use built-in diagnostics
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            error = "LualineDiagnosticError", -- Defined by your colorscheme
            warn = "LualineDiagnosticWarn",
            info = "LualineDiagnosticInfo",
            hint = "LualineDiagnosticHint",
          },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
        },
      },
    },
  },
}

