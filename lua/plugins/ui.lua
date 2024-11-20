return {
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    -- Set lualine as statusline
    {
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
    -- File tree sidebar *chef's kiss
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local HEIGHT_RATIO = 0.8
            local WIDTH_RATIO = 0.5

            require('nvim-tree').setup({
                view = {
                    float = {
                        enable = true,
                        open_win_config = function()
                            local screen_w = vim.opt.columns:get()
                            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                            local window_w = screen_w * WIDTH_RATIO
                            local window_h = screen_h * HEIGHT_RATIO
                            local window_w_int = math.floor(window_w)
                            local window_h_int = math.floor(window_h)
                            local center_x = (screen_w - window_w) / 2
                            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                                - vim.opt.cmdheight:get()
                            return {
                                border = 'rounded',
                                relative = 'editor',
                                row = center_y,
                                col = center_x,
                                width = window_w_int,
                                height = window_h_int,
                            }
                        end,
                    },
                    width = function()
                        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                    end,
                },
            })

            vim.keymap.set('n', '<leader>e', "<Cmd>NvimTreeToggle<cr>", { desc = 'Toggle [E]xplorer', silent = true })
        end
    },
    -- Tab bar at the top like GUI editors
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
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
    -- Pretty commandline, messages, and notifications
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                routes = {
                    {
                        filter = { event = "msg_showmode", find = "recording" },
                        view = "notify",
                        opts = {
                            replace = true
                        }
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    command_palette = true, -- position the cmdline and popupmenu together
                },
            })
            vim.keymap.set("n", "<leader>na", function() require('noice').cmd('all') end,
                { desc = "Show [N]oice list [A]ll" })
            vim.keymap.set("n", "<leader>nd", function() require('noice').cmd('dismiss') end,
                { desc = "[N]oice [D]ismiss messages" })
            vim.keymap.set("n", "<leader>nl", function() require('noice').cmd('last') end,
                { desc = "[N]oice [L]ast message" })
        end
    },
    -- Better vim.ui.select and vim.ui.input
    {
        "stevearc/dressing.nvim",
        opts = {},
    }
}
