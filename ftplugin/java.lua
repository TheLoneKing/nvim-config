-- local cwd = vim.fn.getcwd()

local home_dir = os.getenv('HOME')
local eclipse_jdt_ls_install_dir = home_dir .. '/.local/share/eclipse.jdt.ls'
local eclipse_jdt_ls_version = '1.6.400.v20210924-0641'

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home_dir .. '/.workspace/' .. project_name
print('workspace_dir' .. workspace_dir)

local on_attach = function(client, bufnr)
  require'jdtls.setup'.add_commands()
  -- require'jdtls'.setup_dap() -- Only if nvim-dap is installed

  -- Mappings
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
  buf_set_keymap("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
  buf_set_keymap("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
  buf_set_keymap("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
  buf_set_keymap("v", "crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
  buf_set_keymap("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

  -- For java debug (if using nvim-dap)
  -- buf_set_keymap("n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
  -- buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)

  -- If formatting is enabled
  -- buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Highlight references
  vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
      autocmd!
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]], false)
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- NOTE: Set the correct path here.
    '-jar', eclipse_jdt_ls_install_dir .. '/plugins/org.eclipse.equinox.launcher_' .. eclipse_jdt_ls_version .. '.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- NOTE: Set the correct path here.
    '-configuration', eclipse_jdt_ls_install_dir .. '/config_linux',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- NOTE: Set the correct path here.
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      signatureHelp = {
        enabled = true
      },
      saveActions = {
        organizeImports = true
      },
      sources = {
        organizeImports = {
          starThreshold = 99,
          staticStarThreshold = 99
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
  on_attach = on_attach
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
