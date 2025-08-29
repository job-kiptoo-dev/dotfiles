return {
  "catppuccin/nvim",
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#6c7086", bg = "#1e1e2e" })
  end,
}

