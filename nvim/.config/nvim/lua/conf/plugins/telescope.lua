return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")

  end
}
