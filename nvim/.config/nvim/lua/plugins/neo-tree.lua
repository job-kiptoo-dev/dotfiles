return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right", -- open on the left side
				width = 30,
			},
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			source_selector = {
				winbar = false, -- ✅ hide from winbar
				statusline = false, -- ✅ hide from statusline
			},
			filesystem = {
				follow_current_file = {
					enabled = true, -- new API
				},
				hijack_netrw_behavior = "open_default", -- replace netrw
			},
		})

		-- Auto-open Neo-tree on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
					vim.cmd("Neotree show left") -- open left by default
				end
			end,
		})
	end,
}
