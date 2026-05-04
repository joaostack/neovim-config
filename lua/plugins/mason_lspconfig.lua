return {
        "neovim/nvim-lspconfig",
        config = function()
                require("mason").setup({
                        registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
                })
                require("mason-lspconfig").setup()
                require("roslyn").setup()
                require("blink.cmp").setup({
                        completion = {
                                documentation = { auto_show = true },
                        },
                        keymap = {
                                preset = "none",
                                ["<C-j>"] = { "select_next", "fallback" },
                                ["<C-k>"] = { "select_prev", "fallback" },
                                ["<CR>"] = { "select_and_accept" },
                        },
                })

                vim.diagnostic.config({
                        signs = {
                                numhl = {
                                        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                                        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                                        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                                        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                                },
                                text = {
                                        [vim.diagnostic.severity.ERROR] = "X",
                                        [vim.diagnostic.severity.HINT] = "?",
                                        [vim.diagnostic.severity.INFO] = "I",
                                        [vim.diagnostic.severity.WARN] = "!",
                                },
                        },
                        update_in_insert = true,
                        virtual_text = false,
                        virtual_lines = { current_line = true },
                })
        end,
        dependencies = {
                "seblyng/roslyn.nvim",
                "mason-org/mason-lspconfig.nvim",
                "mason-org/mason.nvim",
                { "saghen/blink.cmp", build = "cargo build --release" },
        },
}
