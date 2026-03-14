return {
	"seblyng/roslyn.nvim",
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			filewatching = "auto",
			broad_search = true,
			silent = true,
		},
	},

	config = function()
		require("roslyn").setup({
			vim.lsp.config("roslyn", {
				on_attach = function()
					print("This will run when the server attaches!")
				end,
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			}),
		})
	end,
}
