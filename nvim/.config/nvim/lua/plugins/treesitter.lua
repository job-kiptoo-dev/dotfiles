return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag", -- 👈 required for autotag
			"nvim-treesitter/playground",
		},
		opts = {
			ensure_installed = {
				-- Core languages
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",

				-- Backend / scripting
				"python",
				"bash",
				"regex",
				"sql",

				-- Extras
				"dockerfile",
				"gitignore",
				"graphql",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true }, -- 👈 now works
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- telescope extras
	{ "nvim-telescope/telescope-symbols.nvim" },
}
