return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6", -- or branch = "0.1.x"
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.7,
						vertical = {
							size = {
								width = "95%",
								height = "95%",
							},
						},
					},
				},
			})
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
}
