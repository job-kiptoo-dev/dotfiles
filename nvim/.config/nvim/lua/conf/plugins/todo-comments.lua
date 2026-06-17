-- ================================================================================================
-- TITLE : todo-comments.nvim
-- ABOUT : Highlight, list and search TODO / FIXME / HACK / NOTE comments in your codebase.
-- LINKS :
--   > github : https://github.com/folke/todo-comments.nvim
-- ================================================================================================

return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = true },
  keys = {
    {
      "]t",
      function() require("todo-comments").jump_next() end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function() require("todo-comments").jump_prev() end,
      desc = "Prev todo comment",
    },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todos (Trouble)" },
  },
}
