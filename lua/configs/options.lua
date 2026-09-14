local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.guicursor = ""

opt.wildmode = { "longest", "list" }
opt.nu = true
opt.relativenumber = true
opt.termguicolors = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.scrolloff = 8
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true

opt.undofile = true
