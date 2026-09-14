return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local builtin = require('telescope.builtin')
    local fc_opts = {
        cwd = vim.env.XDG_CONFIG_HOME,
        results_title = "Config",
    }
      require("dashboard").setup({
          theme = 'hyper',
          config = {
              week_header = {
                  enable = true,
              },
              shortcut = {
                  { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                  {
                      icon = ' ',
                      icon_hl = '@variable',
                      desc = 'Files',
                      group = 'Label',
                      action = function() builtin.find_files() end,
                      key = 'f',
                  },
                  {
                      desc = ' dotfiles',
                      group = 'Number',
                      action = function() builtin.find_files(fc_opts) end,
                      key = 'd',
                  },
              },
          },
      })
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
