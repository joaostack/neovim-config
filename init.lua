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
	--checker = { enabled = true },
})

-- resize keymaps
vim.keymap.set("n", "<C-A-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- editor keymaps
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })

-- buffer keymaps
vim.keymap.set("n", "<leader>c", ":close<CR>", { noremap = true })

vim.g.moonflyTransparent = true
vim.cmd("colorscheme moonfly")
