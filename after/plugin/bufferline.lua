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
