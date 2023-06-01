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
