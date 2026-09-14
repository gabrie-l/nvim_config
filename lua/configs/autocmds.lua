local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufEnter", {
--     pattern = { "*.md", "*.norg", "*.txt", "*.conf", "*tex" },
--     group = group,
--     callback = function()
--         vim.opt_local.wrap = true
--         vim.opt_local.textwidth = 80
--         vim.opt_local.formatoptions:append("t")
--     end,
-- })
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})
autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
    callback = function()
        if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! w")
        end
    end,
    group = general,
    desc = "Auto Save",
})
autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
autocmd("BufEnter", {
    pattern = { "*.md", "*.norg", "*.txt", "*.tex" },
    callback = function()
        vim.cmd("Pencil")
    end,
})
vim.cmd('autocmd VimEnter *.md,*.txt,*.tex :ZenMode')
