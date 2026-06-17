-- ================================================================================================
-- TITLE : telescope.nvim
-- ABOUT : Highly extendable fuzzy finder over lists. Polished with fzf-native + ui-select.
-- LINKS :
--   > github : https://github.com/nvim-telescope/telescope.nvim
-- ================================================================================================

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          width = 0.87,
          height = 0.80,
        },
        path_display = { "truncate" },
        file_ignore_patterns = { "%.git/", "node_modules/", "%.cache/" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = { hidden = true },
      },
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    map("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
    map("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
  end,
}
