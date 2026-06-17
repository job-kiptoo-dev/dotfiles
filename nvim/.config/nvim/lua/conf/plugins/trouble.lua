-- ================================================================================================
-- TITLE : trouble.nvim
-- ABOUT : A pretty, structured list for diagnostics, references, quickfix, symbols and more.
-- LINKS :
--   > github : https://github.com/folke/trouble.nvim
-- ================================================================================================

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { focus = true },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP defs/refs" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
  },
}
