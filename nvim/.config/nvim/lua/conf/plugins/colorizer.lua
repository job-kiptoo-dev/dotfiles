-- ================================================================================================
-- TITLE : nvim-colorizer.lua
-- ABOUT : Renders #RRGGBB / rgb() / named colors inline with their actual color. Great for CSS.
-- LINKS :
--   > github : https://github.com/NvChad/nvim-colorizer.lua
-- ================================================================================================

return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      names = false, -- don't colorize words like "red"
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      tailwind = true,
      mode = "virtualtext",
      virtualtext = "■",
    },
  },
}
