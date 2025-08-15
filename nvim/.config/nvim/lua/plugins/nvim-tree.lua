require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it's the last window open
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  window = { -- Correct for Neo-tree (instead of view)
    position = "right",
    width = 40,
  },

  filesystem = {
    filtered_items = {
      hide_dotfiles = false, -- Show dotfiles
      hide_gitignored = false,
    },
    follow_current_file = { enabled = true }, -- Focus on the current file
    use_libuv_file_watcher = true,            -- Auto refresh
  },

  git_status = {
    window = {
      position = "float", -- Show git status in a floating window
      width = 60,
      height = 20,
    },
  },
})

