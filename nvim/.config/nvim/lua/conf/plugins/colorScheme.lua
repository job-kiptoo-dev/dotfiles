-- ================================================================================================
-- TITLE : catppuccin
-- ABOUT : Soothing pastel theme for Neovim. Polished for a top-tier dev rice.
-- LINKS :
--   > github : https://github.com/catppuccin/nvim
-- ================================================================================================

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte | frappe | macchiato | mocha
      transparent_background = false,
      term_colors = true,
      background = { dark = "mocha" },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.12,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "italic" },
        functions = { "bold" },
        types = { "bold" },
      },
      -- Bordered, slightly contrasted floating windows look much cleaner
      custom_highlights = function(colors)
        return {
          -- Crisp window separators
          WinSeparator = { fg = colors.surface1 },
          -- Make the cursorline subtle but present
          CursorLineNr = { fg = colors.peach, style = { "bold" } },
          -- Nicer floating-window borders
          FloatBorder = { fg = colors.blue, bg = colors.base },
          NormalFloat = { bg = colors.base },
          -- Telescope prompt accents
          TelescopePromptBorder = { fg = colors.blue },
          TelescopeResultsBorder = { fg = colors.surface1 },
          TelescopePreviewBorder = { fg = colors.surface1 },
        }
      end,
      integrations = {
        treesitter = true,
        nvimtree = true,
        telescope = { enabled = true },
        cmp = true,
        gitsigns = true,
        which_key = true,
        bufferline = true,
        indent_blankline = { enabled = true, colored_indent_levels = false },
        mason = true,
        dap = true,
        dap_ui = true,
        notify = true,
        noice = true,
        treesitter_context = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
