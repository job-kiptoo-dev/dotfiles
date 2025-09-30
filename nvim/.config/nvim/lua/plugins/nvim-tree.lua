return {
	"nvim-telescope/telescope.nvim", -- plugin repo
	branch = "0.1.6", -- valid option
	dependencies = { "nvim-lua/plenary.nvim" }, -- correct field name
	config = function()
		-- your telescope config
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
}
