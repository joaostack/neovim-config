return {
        "seblyng/roslyn.nvim",

        dependencies = {
                "tris203/rzls.nvim",
        },

        opts = {
                filewatching = "roslyn",
                broad_search = true,
                silent = true,
        },

        config = function(_, opts)
                require("roslyn").setup({
                        filewatching = opts.filewatching,
                        broad_search = opts.broad_search,
                        silent = opts.silent,

                        on_attach = function(client, bufnr)
                                print("Roslyn attached!")
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
                })
        end,
}
