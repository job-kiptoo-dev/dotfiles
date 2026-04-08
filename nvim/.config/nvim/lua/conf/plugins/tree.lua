
-- ================================================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : A file explorer tree for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================

-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	lazy = false,
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			filters = {
-- 				dotfiles = false, -- Show hidden files (dotfiles)
-- 			},
-- 			view = {
-- 				adaptive_size = true,
-- 			},
-- 		})
--
--     vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
-- 	end,
-- }

return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
                -- MOVED HERE:
                custom = {
                    "^.git$",
                    "node_modules",
                    ".cache",
                    "DS_Store",
                },
                -- MOVED HERE:
                exclude = { ".env", ".gitignore" },
            },
            view = {
                adaptive_size = true,
                side = "left",
                width = 30,
            },
            renderer = {
                highlight_git = true,
                indent_markers = { enable = true },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
        })

        -- Keymap
        vim.keymap.set("n", "<leader>e", ":NvimTreeReveal<cr>")
    end,
}
