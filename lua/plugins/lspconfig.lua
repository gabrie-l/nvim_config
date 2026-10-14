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
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "clangd", "pyright", "bashls", "lua_ls" },
            -- automatic_enable defaults to true in v2: any server Mason
            -- installs gets vim.lsp.enable()'d for you automatically.
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        init = function()
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true, desc = "LSP declaration" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "LSP definition" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "LSP hover" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "LSP implementation" })
            vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { silent = true, desc = "LSP signature help" })
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { silent = true, desc = "LSP type definition" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "LSP code action" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true, desc = "LSP references" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, desc = "LSP rename" })
        end,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- vim.lsp.config('*', ...) merges these into every server's config,
            -- so cmp gets wired up without calling .setup() on each server by hand.
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- Per-server tweaks go here if/when you need them, e.g.:
            -- vim.lsp.config("lua_ls", {
            --     settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            -- })
        end,
    },
}
