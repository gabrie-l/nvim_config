return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v3.8.2",
  enabled = true,
  main = "ibl",
  opts = {},
  dependencies = {
    { "HiPhish/rainbow-delimiters.nvim", lazy = true },
  },

  config = function(_)
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
      "CursorColumn",
      "WhiteSpace",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup({
      indent = {
        highlight = highlight,
        char = "┊",
        -- tab_char = "|",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = highlight,
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = true,
      },
      exclude = {
        filetypes = {
          "NvimTree",
          "Trouble",
          "dashboard",
          "help",
          "notify",
          "packer",
          "sagahover",
          "undotree",
        },
        buftypes = { "terminal", "nofile", "prompt", "quickfix" },
      },
    })
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
