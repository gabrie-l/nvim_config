return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },
			lua = { "selene" },
			yaml = { "yamllint" },
			json = { "cfn-lint" },
			markdown = { "vale" },
			text = { "vale" },
			latex = { "vale" },
		}
	end,
}
