-- ================================================================================================
-- TITLE : diffview.nvim
-- ABOUT : A single tabpage interface for cycling through diffs + a full git file-history browser.
--         Pairs with fugitive/gitsigns rather than replacing them.
-- LINKS :
--   > github : https://github.com/sindrets/diffview.nvim
-- ================================================================================================

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open (working tree)" },
    { "<leader>dV", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Diffview: vs previous commit" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: branch/repo history" },
    { "<leader>df", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: current file history" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
    { "<leader>dx", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { winbar_info = true },
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true,
      },
      file_history = { winbar_info = true },
    },
    file_panel = {
      listing_style = "tree",
      win_config = { position = "left", width = 32 },
    },
    keymaps = {
      view = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
      file_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
    },
  },
}
