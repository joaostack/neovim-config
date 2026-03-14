return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "deno_fmt" },
				css = { "deno_fmt" },
				csharpier = { "csharpier" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "deno_fmt" },
				json = { "deno_fmt" },
				javascriptreact = { "deno_fmt" },
				typescriptreact = { "deno_fmt" },
				markdown = { "deno_fmt" },
			},

			format_on_save = {
				enabled = true,
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
