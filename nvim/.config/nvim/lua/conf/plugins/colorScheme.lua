-- return {
--   "projekt0n/github-nvim-theme",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("github-theme").setup({
--       options = {
--         styles = {
--           comments = "italic",
--           keywords = "bold",
--         },
--       },
--     })
--
--     vim.cmd.colorscheme("github_dark")
--   end,
-- }
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
        telescope = true,
        cmp = true,
        gitsigns = true,
        which_key = true,
        native_lsp = {
          enabled = true,
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

