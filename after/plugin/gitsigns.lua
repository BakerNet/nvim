require('gitsigns').setup()

vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]it Hunk [P]revious' })
vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]it Hunk [N]ext' })
vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk,
  { buffer = bufnr, desc = 'Previw [G]it [H]unk' })
vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame,
  { buffer = bufnr, desc = 'Toggle [G]it Line [B]lame' })
vim.keymap.set('n', '<leader>gu', require('gitsigns').reset_hunk,
  { buffer = bufnr, desc = 'Toggle [G]it [U]ndo (Reset) Hunk' })
