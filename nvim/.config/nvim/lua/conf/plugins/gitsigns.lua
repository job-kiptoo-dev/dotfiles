-- ================================================================================================
-- TITLE : gitsigns.nvim
-- ABOUT : Git decorations in the sign column + inline blame, hunk staging and navigation.
-- LINKS :
--   > github : https://github.com/lewis6991/gitsigns.nvim
-- ================================================================================================

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 400,
    },
    current_line_blame_formatter = "  <author>, <author_time:%R> · <summary>",
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation between hunks
      map("n", "]h", function()
        if vim.wo.diff then return "]h" end
        vim.schedule(function() gs.nav_hunk("next") end)
        return "<Ignore>"
      end, "Next hunk")
      map("n", "[h", function()
        if vim.wo.diff then return "[h" end
        vim.schedule(function() gs.nav_hunk("prev") end)
        return "<Ignore>"
      end, "Prev hunk")

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")
    end,
  },
}
