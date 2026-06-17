-- ================================================================================================
-- TITLE : vim-fugitive
-- ABOUT : The premier Git plugin for Vim/Neovim. tpope's git command center.
-- LINKS :
--   > github : https://github.com/tpope/vim-fugitive
--   > github : https://github.com/tpope/vim-rhubarb  (GBrowse -> open on GitHub)
-- ================================================================================================

return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gwrite", "Gread", "Gdiffsplit", "Gvdiffsplit", "GBrowse" },
  dependencies = {
    "tpope/vim-rhubarb", -- enables :GBrowse for GitHub remotes
  },
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git status (fugitive)" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame (full)" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vsplit)" },
    { "<leader>gD", "<cmd>Gvdiffsplit HEAD<cr>", desc = "Git diff vs HEAD" },
    { "<leader>gl", "<cmd>Git log --oneline --graph --decorate<cr>", desc = "Git log graph" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
    { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git stage current file" },
    { "<leader>go", "<cmd>Gread<cr>", desc = "Git checkout current file (revert)" },
    { "<leader>gB", "<cmd>GBrowse<cr>", mode = { "n", "v" }, desc = "Open in browser (GitHub)" },

    -- ── Merge-conflict workflow (3-way diff) ─────────────────────────────────
    -- Open the 3-way split for the conflicted file:  left = //2 (ours/target),
    -- middle = working copy, right = //3 (theirs/merge).
    { "<leader>mm", "<cmd>Gvdiffsplit!<cr>", desc = "Merge: open 3-way diff" },
    { "<leader>mM", "<cmd>Git mergetool<cr>", desc = "Merge: load all conflicts to quickfix" },
    { "<leader>mh", "<cmd>diffget //2<cr>", desc = "Merge: take LEFT (ours / HEAD)" },
    { "<leader>ml", "<cmd>diffget //3<cr>", desc = "Merge: take RIGHT (theirs)" },
    { "<leader>ms", "<cmd>Gwrite!<cr>", desc = "Merge: stage resolved file" },
  },
}
