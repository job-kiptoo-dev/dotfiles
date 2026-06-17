-- ================================================================================================
-- TITLE : alpha-nvim
-- ABOUT : A fast, fully programmable greeter / start screen for Neovim.
-- LINKS :
--   > github : https://github.com/goolord/alpha-nvim
-- ================================================================================================

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "  Live grep", "<cmd>lua require('fzf-lua').live_grep()<CR>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("e", "  File explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("c", "  Config", "<cmd>e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    dashboard.opts.layout[1].val = 6

    alpha.setup(dashboard.opts)

    -- Footer with plugin count + startup time once lazy finishes
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val =
          "  " .. stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
