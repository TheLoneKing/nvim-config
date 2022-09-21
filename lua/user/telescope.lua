-- Load dependencies
require('plenary.async')
local status_ok, telescope = pcall(require, 'telescope')
if status_ok then
  telescope.load_extension('fzf')
  -- Add key-bindings for telescope
  local keymap = vim.keymap.set
  keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
  keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
  keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
  keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
else
  print('Telescope plugin could not be loaded!')
  return
end

-- Interesting pickers
-- `git_status`
-- `git_commits`
-- `git_bcommits`
-- `git_branches`
-- `git_stash`    - Lists stash items in current repository with ability to apply them on <cr>.
-- `buffers`      - lists the open buffers in current neovim instance.
-- `grep_string`  - searches for the string under the cursor in the current working directory.
-- `pickers`      - lists recently used telescope pickers.
-- `treesitter`   - lists function names and variables from treesitter.
-- There are several LSP related pickers.
-- More info: https://github.com/nvim-telescope/telescope.nvim#pickers
