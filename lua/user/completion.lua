-- load lspkind plugin
local lspkind = require 'lspkind'
lspkind.init()

local cmp = require 'cmp'

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    },
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' },  -- Uncomment after installing luasnip
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'nvim_lua' }
  },
  -- Uncomment after installing luasnip
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body)
  --   end
  -- },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = '[LSP]',
        luasnip = '[snip]',
        buffer = '[buf]',
        path = '[path]',
        nvim_lua = '[NVIM_LUA]'
      }
    }
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
}
