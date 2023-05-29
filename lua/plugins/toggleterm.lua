require('toggleterm').setup({
  open_mapping = [[<C-t>]],
  size = 20,
  persist_mode = true
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set('n', '<leader>tv', [[<Cmd>ToggleTerm size=100 direction=vertical persist_mode=true<CR>]])
vim.keymap.set('n', '<leader>th', [[<Cmd>ToggleTerm size=20 direction=horizontal persist_mode=true<CR>]])
