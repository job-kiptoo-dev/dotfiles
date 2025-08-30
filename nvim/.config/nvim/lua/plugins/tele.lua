-- See `:help telescope` and `:help telescope.setup()`
-- require("telescope").setup({
-- 	defaults = {
-- 		layout_strategy = "vertical",
-- 		layout_config = {
-- 			width = 0.95,
-- 			height = 0.95,
-- 			preview_height = 0.7,
-- 		},
-- 	},
-- })

-- vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.95,
					height = 0.95,
					preview_height = 0.7,
				},
			},
		})

		-- Keymaps
		vim.keymap.set(
			"n",
			"<Leader>sn",
			"<CMD>lua require('telescope').extensions.notify.notify()<CR>",
			{ silent = true, desc = "Telescope notify" }
		)
	end,
}
