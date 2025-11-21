return {
  -- nvim tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        renderer = {
          icons = {
            show = {
              git = false,
            },
          }
	},
        on_attach = function(bufnr)
          local api = require'nvim-tree.api'

          api.config.mappings.default_on_attach(bufnr)

          -- disable w
          vim.keymap.set('n', 'w', '', { buffer = bufnr, noremap = true, silent = true })
          -- disable q
          vim.keymap.set('n', 'q', '', { buffer = bufnr, noremap = true, silent = true })
          -- remap new tab to t
          vim.keymap.set('n', 't', api.node.open.tab, { buffer = bufnr, noremap = true, silent = true })
        end,
      })
    end,
  },

  -- vim fugitive
  {
    'tpope/vim-fugitive',
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require'nvim-treesitter.configs'.setup({
        highlight = { enable = true },
        indent = { enable = true },
	ensure_installed = {
	  'rust',
	  'lua',
	  'vim',
	  'vimdoc',
	  'bash',
	  'markdown',
	  'json',
	  'yaml',
	  'toml',
	  'c',
	}
      })
    end,
  },

  -- nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    lazy = false,
  },

  -- rustaceanvim
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
  },

  -- nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',          -- optional snippet support
      'saadparwaiz1/cmp_luasnip',  -- optional snippet completion
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = {
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<Esc>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.close()
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      })
    end,
  },

  -- colorschemes
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'catppuccin/nvim',
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
  },
}
