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

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch pane left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch pane right" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch pane up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch pane down" })
keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current split" })

-- Finding files
keymap.set("n", "<leader>ff", function()
	vim.cmd("Telescope find_files")
end, { desc = "Find files" })
keymap.set("n", "<leader>fb", function()
	vim.cmd("Telescope buffers")
end, { desc = "Find files" })
keymap.set("n", "<leader>fg", function()
	vim.cmd("Telescope live_grep")
end, { desc = "Find files" })
keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- Switching buffers
keymap.set("n", "<S-l>", "<CMD>bnext<CR>")
keymap.set("n", "<S-h>", "<CMD>bprevious<CR>")
keymap.set("n", "<S-q>", "<CMD>:Bdelete<CR>", { desc = "Close buffer" })

-- TogglTerm
vim.keymap.set("n", "<A-Space>", function()
	vim.cmd("FloatermToggle")
end, { desc = "Toggle Term" })
vim.keymap.set("t", "<A-Space>", function()
	vim.cmd("FloatermToggle")
end, { desc = "Toggle Term" })

keymap.set("n", "<leader>v", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

-- LazyGit
keymap.set("n", "<leader>lg", function()
	vim.cmd("LazyGit")
end, { desc = "Open LazyGit" })

keymap.set("n", "<leader>tt", function()
	vim.cmd("Themery")
end, { desc = "Open Themery" })

keymap.set("n", "<leader>lf", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Indent current line with Tab in normal mode
keymap.set("n", "<Tab>", ">>", { desc = "Indent current line" })

-- De-indent current line with Shift+Tab in normal mode
keymap.set("n", "<S-Tab>", "<<", { desc = "De-indent current line" })

-- Indent visual selection with Tab in visual mode
keymap.set("v", "<Tab>", ">", { desc = "Indent visual selection" })

-- De-indent visual selection with Shift+Tab in visual mode
keymap.set("v", "<S-Tab>", "<", { desc = "De-indent visual selection" })

keymap.set("i", "<S-Tab>", "<", { desc = "De-indent in insert" })

keymap.set("n", ":", "<cmd>FineCmdline<CR>", { noremap = true, silent = true })

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
