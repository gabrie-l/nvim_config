return {
	"stevearc/conform.nvim",
    opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			bash = { "beautysh", "shfmt" },
			zsh = { "beautysh" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			json = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 200,
			lsp_format = "fallback",
		},
	},
	config = function(_,opts) require("conform").setup(opts) end
}
