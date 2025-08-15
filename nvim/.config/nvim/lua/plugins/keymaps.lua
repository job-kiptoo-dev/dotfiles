-- vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
-- vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
-- vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
-- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
-- vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
-- vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")
--

-- telescope
-- File search
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- Git specific
vim.keymap.set("n", "<leader>fgf", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
vim.keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
vim.keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })





-- tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- icon picker
vim.keymap.set("n", "<leader>ic", ":IconPickerNormal<cr>", { noremap = true, silent = true })

-- twilight
vim.keymap.set("n", "<leader>il", ":Twilight<cr>")

-- zen mode
vim.keymap.set("n", "<leader>zm", ":ZenMode<cr>")

-- format code using LSP
-- vim.keymap.set("n", "<leader>pp", vim.lsp.buf.format)

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<cr>")

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")

------------------
-- goto-preview --
------------------
--
-- note: lsp config (from lsp.lua)
-- -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
-- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
--
vim.keymap.set('n', '<leader>gd', require('goto-preview').goto_preview_definition, { desc = 'Preview Definition' })
vim.keymap.set('n', '<leader>gt', require('goto-preview').goto_preview_type_definition,
  { desc = 'Preview Type Definition' })
vim.keymap.set('n', '<leader>gi', require('goto-preview').goto_preview_implementation,
  { desc = 'Preview Implementation' })
vim.keymap.set('n', '<leader>gp', require('goto-preview').close_all_win, { desc = 'Close Previews' })
