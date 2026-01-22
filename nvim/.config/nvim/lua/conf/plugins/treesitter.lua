-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--
--   config = function()
--     require("nvim-treesitter.configs").setup({
--         ensure_installed = {
--           "c",
--           "cpp",
--           "python",
--           "html",
--           "css",
--           "matlab",
--           "javascript",
--           "lua",
--           "vim",
--           "vimdoc",
--           "query"
--         },
--
--         sync_install = false,
--         auto_install = true,
--
--         autopairs = {
--           enable = true,
--         },
--
--         highlight = {
--           enable = true,
--           additional_vim_regex_highlighting = false,
--         },
--
--         indent = {
--           enable = true,
--           --disable = { "python", "c" } -- these and some other langs don't work well
--         },
--       })
--   end
-- }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- event = { "BufReadPost", "BufNewFile" },
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      ensure_installed = {
        "c", "cpp", "python", "html", "css",
        "matlab", "javascript", "lua",
        "vim", "vimdoc", "query",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
