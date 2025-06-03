vim.g.mapleader = " "

local keymap = vim.keymap
-- Basic Navigation
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horisontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<A-Space>", function()
  vim.cmd("FloatermToggle")
end, { desc = "Toggle Terminal" })

keymap.set("t", "<A-Space>", function()
  vim.cmd("FloatermToggle")
end, { desc = "Toggle Terminal" })

-- Switching buffers
keymap.set("n", "<S-q>", "<CMD>:Bdelete<CR>", { desc = "Close buffer" })

-- Indent current line with Tab in normal mode
keymap.set("n", "<Tab>", ">>", { desc = "Indent current line" })

-- De-indent current line with Shift+Tab in normal mode
keymap.set("n", "<S-Tab>", "<<", { desc = "De-indent current line" })

-- Indent visual selection with Tab in visual mode
keymap.set("v", "<Tab>", ">", { desc = "Indent visual selection" })

-- De-indent visual selection with Shift+Tab in visual mode
keymap.set("v", "<S-Tab>", "<", { desc = "De-indent visual selection" })

keymap.set("i", "<S-Tab>", "<", { desc = "De-indent in insert" })

-- Go to next diagnostic (Warning or Error), wrap around file, and show in float
keymap.set("n", "J", function()
  vim.diagnostic.goto_next({
    --     severity = {min = vim.diagnostic.severity.WARN},
    wrap = true,
    float = true,
  })
end, { desc = "Go to next warning/error" })

-- Go to previous diagnostic (Warning or Error), wrap around file, and show in float
keymap.set("n", "K", function()
  vim.diagnostic.goto_prev({
    -- severity = {min = vim.diagnostic.severity.WARN},
    wrap = true,
    float = true,
  })
end, { desc = "Go to previous warning/error" })
