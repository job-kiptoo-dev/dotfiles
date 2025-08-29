return {
  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  -- Mason LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ruff_lsp",
          "tailwindcss",
          "tsserver",
          "eslint",
        },
      })
    end,
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        -- Diagnostic keymaps
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
        vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
        vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Diagnostic List" })

        -- LSP keymaps
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          if vim.lsp.buf.format then
            vim.lsp.buf.format()
          elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
          end
        end, { desc = "Format current buffer with LSP" })
      end

      -- nvim-cmp capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        pyright = {
          pyright = { disableOrganizeImports = true },
          python = {
            analysis = {
              ignore = { "*" },
              autoImportCompletions = false,
            },
          },
        },
        ruff_lsp = {},
        tsserver = {},
        tailwindcss = {},
        eslint = {},
      }

      local lspconfig = require("lspconfig")
      for server, config in pairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = config,
        })
      end
    end,
  },

  -- Fidget (LSP status)
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = true,
  },
}

