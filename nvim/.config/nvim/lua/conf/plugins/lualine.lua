-- ================================================================================================
-- TITLE : lualine.nvim
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ABOUT : A blazing fast and easy to configure Neovim statusline written in Lua.
-- ================================================================================================

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Show the active LSP server(s) for the current buffer
    local function lsp_names()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then return "" end
      local names = {}
      for _, client in ipairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(names, client.name)
        end
      end
      return "  " .. table.concat(names, ", ")
    end

    require("lualine").setup({
      options = {
        theme = "catppuccin-mocha",
        icons_enabled = true,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "alpha", "dashboard" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "  " } },
        },
        lualine_x = {
          { lsp_names, color = { fg = "#a6e3a1" } },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
      },
      extensions = { "nvim-tree", "lazy", "trouble", "mason" },
    })
  end,
}
