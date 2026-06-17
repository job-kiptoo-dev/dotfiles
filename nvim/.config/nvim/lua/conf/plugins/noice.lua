-- ================================================================================================
-- TITLE : noice.nvim
-- ABOUT : Replaces the UI for messages, cmdline and the popupmenu. Fancy notifications via notify.
-- LINKS :
--   > github : https://github.com/folke/noice.nvim
-- ================================================================================================

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 3000,
        stages = "fade_in_slide_out",
        render = "compact",
        max_height = function() return math.floor(vim.o.lines * 0.75) end,
        max_width = function() return math.floor(vim.o.columns * 0.55) end,
      },
    },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    routes = {
      -- Hide "written" messages, they're just noise
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        opts = { skip = true },
      },
    },
  },
  keys = {
    { "<leader>nh", "<cmd>Noice history<cr>", desc = "Noice history" },
    { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss notifications" },
  },
}
