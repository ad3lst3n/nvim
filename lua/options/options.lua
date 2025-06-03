vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.diagnostic.config({ virtual_text = false })

opt.relativenumber = true
opt.number = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

opt.scrolloff = 10
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search Settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
