-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require('nord').set()
vim.cmd [[colorscheme nord]]