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
  name = "catppuccin",
  "catppuccin/nvim",
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



-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT : A subtle, warm colorscheme for Neovim inspired by Sublime Text's Melange theme.
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================
--
-- return {
-- 	{
-- 		"xiyaowong/nvim-transparent",
-- 		lazy = false,
-- 		priority = 999,
-- 		opts = {
-- 			extra_groups = {
-- 				"NvimTreeNormal",
-- 				"NvimTreeNormalNC",
-- 				"NvimTreeSignColumn",
-- 				"NvimTreeEndOfBuffer",
-- 				"NvimTreeWinSeparator",
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"EdenEast/nightfox.nvim",
-- 		lazy = false,
-- 		priority = 999,
-- 		config = function()
-- 			local palette = require("nightfox.palette").load("duskfox")
--
-- 			require("nightfox").setup({
-- 				options = {
-- 					transparent = false,
-- 				},
-- 				groups = {
-- 					duskfox = {
-- 						Visual = { bg = palette.bg1 },
-- 					},
-- 				},
-- 			})
-- 			vim.cmd("colorscheme duskfox")
-- 		end,
-- 	},
-- }
