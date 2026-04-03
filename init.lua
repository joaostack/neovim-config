require("options")

-- Bootstrap lazy.nvim
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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

-- resize keymaps
vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- explorer
vim.keymap.set("n", "<leader>e", "<Cmd>:NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })

-- editor keymaps
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
-- move between buffers
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")

-- buffer keymaps
vim.api.nvim_set_keymap("n", "<Leader>q", ":bd|bp<CR>", { noremap = true, silent = true, desc = "Close buffer" })

vim.cmd("colorscheme base16-ia-dark")
