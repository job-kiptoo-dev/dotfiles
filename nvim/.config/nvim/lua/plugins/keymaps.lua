return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fgf", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
			{ "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
			{ "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
			{ "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
		},
	},

	-- Neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },
		},
	},

	-- Icon picker
	{
		"ziontee113/icon-picker.nvim",
		keys = {
			{ "<leader>ic", "<cmd>IconPickerNormal<cr>", desc = "Pick Icon", noremap = true, silent = true },
		},
	},

	-- Twilight
	{
		"folke/twilight.nvim",
		keys = {
			{ "<leader>il", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
		},
	},

	-- Zen Mode
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
		},
	},

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = "markdown",
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
		},
	},

	-- nvim-comment
	{
		"terrortylor/nvim-comment",
		keys = {
			{ "<leader>/", "<cmd>CommentToggle<cr>", mode = { "n", "v" }, desc = "Toggle Comment" },
		},
	},

	-- goto-preview
	{
		"rmagatti/goto-preview",
		config = true,
		keys = {
			{ "<leader>gd", require("goto-preview").goto_preview_definition, desc = "Preview Definition" },
			{ "<leader>gt", require("goto-preview").goto_preview_type_definition, desc = "Preview Type Definition" },
			{ "<leader>gi", require("goto-preview").goto_preview_implementation, desc = "Preview Implementation" },
			{ "<leader>gp", require("goto-preview").close_all_win, desc = "Close Previews" },
		},
	},
}
