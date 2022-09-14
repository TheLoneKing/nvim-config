require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- Folding Documentation at `:h fold-commands`
-- To fold use `zf`. `zf{motion}` or `{Visual}zf` also works.{{{
-- To unfold one layer on cursor, use `zd`.
-- To unfold all the way on cursor, use `zD`.}}}
vim.opt.foldmethod = 'marker'
vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'

-- Workaround for issue with folds.
-- See https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
---ENDWORKAROUND
