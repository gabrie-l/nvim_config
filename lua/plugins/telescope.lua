return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    { "nvim-telescope/telescope-fzf-native.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")
            telescope.setup({
                defaults = {
                    mappings = {
                        n = {
                            ['<c-r>'] = actions.delete_buffer
                        }, -- n
                        i = {
                            ["<C-h>"] = "which_key",
                            ['<c-r>'] = actions.delete_buffer
                        } -- i
                    },
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                    buffers = {
                        sort_lastused = true,
                        ignore_current_buffer = true,
                    },
                    diagnostics = {
                        bufnr = 0,
                    },
                },
            })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Telescope colorscheme" })
            vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>m", builtin.marks, { desc = "Telescope list marks" })
            vim.keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "Telescope quickfix list" })
            vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope diagnostics" })
            vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope lsp references" })
            vim.keymap.set(
                "n",
                "<leader>bf",
                builtin.current_buffer_fuzzy_find,
                { desc = "Telescope fuzzy find in current buffer" }
            )
            vim.keymap.set(
                "n",
                "<leader>td",
                ":TodoTelescope<CR>",
                { noremap = true, silent = true, desc = "Telescope todo comments" }
            )
            local fc_opts = {
                cwd = vim.env.XDG_CONFIG_HOME,
                results_title = "Config",
            }
            vim.keymap.set("n", "<leader>fc", function()
                builtin.find_files(fc_opts)
            end, { desc = "Fuzzy find config files" })

        end,
    }
}
