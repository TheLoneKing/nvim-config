local M = {}

M.dap_keymaps = function (bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap("n", "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
  buf_set_keymap("n", "<F9>", "<Cmd>lua require'dap'.continue()<CR>", opts)
  buf_set_keymap("n", "<A-F7>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
  buf_set_keymap("n", "<F8>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
  buf_set_keymap("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
end

return M
