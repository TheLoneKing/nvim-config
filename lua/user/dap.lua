local M = {}

M.dap_keymaps = function (bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap("n", "<leader>db", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
  buf_set_keymap("n", "<F9>", "<Cmd>lua require('dap').continue()<CR>", opts)
  buf_set_keymap("n", "<A-F7>", "<Cmd>lua require('dap').step_into()<CR>", opts)
  buf_set_keymap("n", "<F8>", "<Cmd>lua require('dap').step_over()<CR>", opts)
  buf_set_keymap("n", "<leader>dr", "<Cmd>lua require('dap').repl.open()<CR>", opts)
end

local status_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if status_ok then
  dap_virtual_text.setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = true,                -- show virtual text on all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  }
else
  print('nvim-dap-virtual-text plugin not loaded.')
end

return M
