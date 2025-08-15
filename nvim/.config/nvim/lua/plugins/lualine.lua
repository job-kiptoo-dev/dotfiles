local colors = require("catppuccin.palettes").get_palette()

require("lualine").setup({
  options = {
    theme = "catppuccin",
    component_separators = "",
    section_separators = { left = "", right = "" }, -- Bubble edges
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = {
      { "branch", icon = "" },
      { "diff" },
    },
    lualine_c = {
      { "filename", path = 1 },
    },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = colors.base, bg = colors.peach },
        separator = { right = "" },
      },
    },
    lualine_y = {
      { "filetype", separator = { left = "" }, right_padding = 2 },
    },
    lualine_z = {
      { "location", separator = { left = "" }, right_padding = 2 },
    },
  },
})

