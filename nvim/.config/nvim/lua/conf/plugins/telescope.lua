return {
  "nvim-telescope/telescope.nvim",
  -- Change 'tag' to 'branch' to get compatibility fixes
  branch = "0.1.x", 
  dependencies = { "nvim-lua/plenary.nvim" },
  
  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

   vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    -- Tip: You can do this via Lua instead of a string command
    vim.keymap.set("n", "<leader>fh", function()
      builtin.find_files({ hidden = true })
    end)
  end
}
