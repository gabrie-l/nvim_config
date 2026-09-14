return {
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },
    {
        "echasnovski/mini.ai",
        version = false,

        opts = function()
            local ai = require("mini.ai").gen_spec.treesitter
            local fcall = require("mini.ai").gen_spec.function_call
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai({ a = "@function.outer", i = "@function.inner" }), -- function
                    c = ai({ a = "@class.outer", i = "@class.inner" }),  -- class
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                    d = { "%f[%d]%d+" },                                 -- digits
                    e = {                                                -- Word with case
                        {
                            "%u[%l%d]+%f[^%l%d]",
                            "%f[%S][%l%d]+%f[^%l%d]",
                            "%f[%P][%l%d]+%f[^%l%d]",
                            "^[%l%d]+%f[^%l%d]",
                        },
                        "^().*()$",
                    },
                    g = function()
                        local from = { line = 1, col = 1 }
                        local to = {
                            line = vim.fn.line("$"),
                            col = math.max(vim.fn.getline("$"):len(), 1),
                        }
                        return { from = from, to = to }
                    end,
                    u = fcall(),            -- u for "Usage"
                    U = fcall({ name_pattern = "[%w_]" }), -- without dot in function name
                },
                mappings = {
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[a"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                        ["[A"] = "@parameter.inner",
                    },
                },
            }
        end,
    },
    {
        "echasnovski/mini.pairs",
        config = function()
            require("mini.pairs").setup()
        end,
    },
    {
        "echasnovski/mini.indentscope",
        config = function()
            require("mini.indentscope").setup()
        end,
    },
    {
        "echasnovski/mini.comment",
        config = function()
            require("mini.comment").setup()
        end,
    },
    {
        "echasnovski/mini.icons",
        config = function()
            require("mini.icons").setup()
        end,
    },
}
