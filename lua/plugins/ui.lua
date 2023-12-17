return {
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    { -- File tree sidebar *chef's kiss
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
            })

            vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<cr>", { desc = 'Toggle [E]xplorer' })
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        options = {
        },
        config = function()
            require("bufferline").setup {
                options = {
                    separator_style = 'slant',
                    show_buffer_close_icons = false,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true -- use a "true" to enable the default, or set your own character
                        }
                    }
                }
            }

            vim.keymap.set('n', '<leader>bs', '<Cmd>BufferLinePick<CR>', { desc = '[B]uffer [S]elect' })
            vim.keymap.set('n', '<leader>bd', '<Cmd>BufferLinePickClose<CR>', { desc = '[B]uffer [D]elete' })
        end
    },
    -- Clean visual mode
    {
        'folke/zen-mode.nvim',
        config = function()
            vim.keymap.set("n", "<leader>zm", function()
                require("zen-mode").setup {
                    window = {
                        width = 90,
                        options = {}
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = true
                vim.wo.number = true
                vim.wo.rnu = true
            end)
        end
    },
}
