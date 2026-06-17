-- ================================================================================================
-- TITLE : catppuccin
-- ABOUT : Soothing pastel theme for Neovim. Kept simple/clean.
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
      integrations = {
        treesitter = true,
        nvimtree = true,
        telescope = { enabled = true },
        cmp = true,
        gitsigns = true,
        which_key = true,
        mason = true,
        dap = true,
        dap_ui = true,
        native_lsp = { enabled = true },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
