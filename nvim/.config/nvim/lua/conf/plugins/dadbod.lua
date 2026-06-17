-- ================================================================================================
-- TITLE : vim-dadbod (+ ui + completion)
-- ABOUT : Connect to databases, browse schemas in a tree, and run SQL queries inside Neovim.
--         Supports Postgres, MySQL, SQLite, and many more via dadbod adapters.
-- LINKS :
--   > github : https://github.com/tpope/vim-dadbod
--   > github : https://github.com/kristijanhusak/vim-dadbod-ui
--   > github : https://github.com/kristijanhusak/vim-dadbod-completion
-- ================================================================================================

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  keys = {
    { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Database UI (toggle)" },
    { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "DB: add connection" },
    { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB: find buffer" },
  },
  init = function()
    -- Use icons + a tidy layout
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_winwidth = 32
    -- Auto-run saved queries on open, and where to keep saved queries
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
    vim.g.db_ui_tmp_query_location = vim.fn.stdpath("data") .. "/dadbod_ui/tmp"
    -- Pick up connections from a project-local .env (DATABASE_URL, etc.)
    vim.g.db_ui_dotenv_variable_prefix = "DATABASE_"

    -- Wire dadbod-completion into nvim-cmp for SQL buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "sql", "mysql", "plsql" },
      callback = function()
        local ok, cmp = pcall(require, "cmp")
        if ok then
          cmp.setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "luasnip" },
            },
          })
        end
      end,
    })
  end,
}
