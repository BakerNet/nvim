-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  },
  extensions = {
    advanced_git_search = {
      -- fugitive or diffview
      diff_plugin = "diffview",
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'advanced_git_search')
pcall(require('telescope').load_extension, 'live_grep_args')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').git_files, { desc = '[F]ind project [F]iles' })
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').find_files, { desc = '[F]ind [A]ll files' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args,
  { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fc', require('telescope').extensions.advanced_git_search.diff_commit_file,
  { desc = '[F]ind [C]ommit for file' })
vim.keymap.set({ 'n', 'v' }, '<leader>fl', require('telescope').extensions.advanced_git_search.diff_commit_line,
  { desc = '[F]ind commit for [L]ines' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
