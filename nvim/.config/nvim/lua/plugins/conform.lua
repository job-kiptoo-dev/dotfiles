return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier" },
			},
			-- Set global options
			format_on_save = {
				lsp_fallback = true, -- use LSP formatting if no formatter is found
				timeout_ms = 500,
			},
			keys = {
				{
					"<leader>f",
					function()
						require("conform").format({
							lsp_fallback = true,
							async = false,
							timeout_ms = 500,
						})
					end,
					mode = { "n", "v" },
					desc = "Format code",
				},
			},
		})
	end,
}
