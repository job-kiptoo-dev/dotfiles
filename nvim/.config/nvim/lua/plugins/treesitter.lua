-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        -- Core languages
        "lua", "vim", "vimdoc",
        "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml","markdown_inline",

        -- Backend / scripting
        "python", "bash", "regex", "sql",

        -- Documentation
        "markdown", "markdown_inline",

        -- Extras
        "dockerfile", "gitignore", "graphql"
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}

