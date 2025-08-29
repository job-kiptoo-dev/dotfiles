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

-- vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent
