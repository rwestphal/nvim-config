local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    -- Required for snippet support
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Select the next item
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Select the previous item
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- Confirm selection. Use `(` to trigger the snippet
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    -- Manually trigger completion
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- The most important source: gets suggestions from rust-analyzer
    { name = 'luasnip' },   -- Snippet suggestions
    { name = 'buffer' },    -- Text in the current buffer
    { name = 'path' },      -- File paths
  }),
})
