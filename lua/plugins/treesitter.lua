---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"c_sharp",
		},
	},
}
