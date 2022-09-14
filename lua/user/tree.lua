require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = 'all'
  },
  -- filters = {
  --   custom = { '^\\.git' }
  -- },
  actions = {
    expand_all = {
      exclude = { '.git', 'target', 'build', 'dist' }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true
  }
})

-- DEFAULT KEYMAPPINGS (for more default keymappings, `:h nvim-tree-default-mappings`)
-- `R`               refresh             refresh the tree
-- `a`               create              add a file; leaving a trailing `/` will add a directory
-- `d`               remove              delete a file (will prompt for confirmation)
-- `D`               trash               trash a file via |trash| option
-- `r`               rename              rename a file
-- `<C-r>`           full_rename         rename a file and omit the filename on input
-- `x`               cut                 add/remove file/directory to cut clipboard
-- `c`               copy                add/remove file/directory to copy clipboard
-- `p`               paste               paste from clipboard; cut clipboard has precedence over copy; will prompt for confirmation
-- `y`               copy_name           copy name to system clipboard
-- `Y`               copy_path           copy relative path to system clipboard
-- `gy`              copy_absolute_path  copy absolute path to system clipboard
-- `f`               live_filter         live filter nodes dynamically based on regex matching.
-- `F`               clear_live_filter   clear live filter
-- `q`               close               close tree window
-- `W`               collapse_all        collapse the whole tree
-- `E`               expand_all          expand the whole tree, stopping after expanding |actions.expand_all.max_folder_discovery| folders; this might hang neovim for a while if running on a big folder
-- `S`               search_node         prompt the user to enter a path and then expands the tree to match the path
