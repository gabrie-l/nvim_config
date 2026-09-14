return {

    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        init = function()
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true, desc = "LSP definition" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "LSP definition" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "LSP hover" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "LSP implementation" })
            vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { silent = true, desc = "LSP signature help" })
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { silent = true, desc = "LSP definition type" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "LSP code action" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true, desc = "LSP references" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "LSP code action" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, desc = "LSP code action" })
        end,
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.textlsp.setup({
                capabilities = capabilities,
            })
            lspconfig.sourcekit.setup({
                root_dir = function(filename, _)
                    local util = require("lspconfig.util")

                    return util.root_pattern("buildServer.json")(filename)
                        or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
                        or util.root_pattern("Package.swift")(filename)
                        or util.root_pattern("*.swift")(filename)
                end,
                capabilities = capabilities,
            })
        end,
    },
}
