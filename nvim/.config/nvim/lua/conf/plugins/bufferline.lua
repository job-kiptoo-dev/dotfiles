-- ================================================================================================
-- TITLE : bufferline.nvim
-- ABOUT : A snazzy, IDE-like buffer/tab line for the top of the editor.
-- LINKS :
--   > github : https://github.com/akinsho/bufferline.nvim
-- ================================================================================================

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
    { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick close buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers left" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers right" },
  },
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        local icons = { error = " ", warning = " ", info = " " }
        local ret = (diag.error and icons.error .. diag.error .. " " or "")
          .. (diag.warning and icons.warning .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "  Explorer",
          text_align = "left",
          separator = true,
          highlight = "Directory",
        },
      },
      separator_style = "slant",
      show_buffer_close_icons = true,
      show_close_icon = false,
      always_show_bufferline = true,
      indicator = { style = "underline" },
      hover = { enabled = true, delay = 150, reveal = { "close" } },
    },
  },
}
