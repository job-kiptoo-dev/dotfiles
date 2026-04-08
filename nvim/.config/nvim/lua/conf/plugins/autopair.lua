return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter" },
  branch = "v0.6", -- Use the stable branch to avoid nil-index bugs
  config = function()
    require("ultimate-autopair").setup({
      extensions = {
        tsnode = {
          enable = true, -- Can stay on now that parsers are installed
        },
        filetype = {
          -- This is the correct way to disable the plugin for specific files
          ignore = {
            "gitcommit",
            "gitrebase",
            "lazygit",
            "sh",
            "text",
          },
        },
      },
    })
  end,
}
