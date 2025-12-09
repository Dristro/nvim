-- Code from Gemini for CMP (VSC intellisence)

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter', -- Load cmp when entering Insert mode
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP source
    'hrsh7th/cmp-buffer',   -- Buffer words source
    'hrsh7th/cmp-path',    -- File system paths source
    'saadparwaiz1/cmp_luasnip', -- For luasnip users
    -- Add other cmp-sources as needed, e.g., 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-calc'
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip') -- If using luasnip

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users
        { name = 'buffer' },
        { name = 'path' },
        -- Add other sources here
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For luasnip users
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Optional: Setup for specific filetypes (e.g., gitcommit)
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- Requires petertriho/cmp-git
        { name = 'buffer' },
      })
    })
  end
}
