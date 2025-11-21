require("config.lazy")
require("config.cmp")

vim.cmd.colorscheme 'github_light'
--vim.cmd.colorscheme 'oxocarbon'

----------------------------------------
-- keymaps
----------------------------------------

local map = vim.keymap.set

-- disable q in normal mode
map('n', 'q', '<Nop>')

-- window navigation (kept exactly as your mappings)
map('n', '45', '<C-w><C-w><CR>')
map('n', '54', ':wincmd h<CR>', { silent = true })

-- tab navigation
map('n', 'qw', ':tabnext<CR>', { silent = true })
map('n', 'wq', ':tabprev<CR>', { silent = true })

----------------------------------------
-- basic settings
----------------------------------------

local o = vim.opt

o.mouse = ''
o.termguicolors = true
o.wrap = false
o.ruler = true
o.wildmode = { 'longest', 'list' }
o.tabpagemax = 100
o.swapfile = false

----------------------------------------
-- folding
----------------------------------------

o.foldmethod = 'indent'
o.foldnestmax = 2
vim.api.nvim_create_autocmd('BufRead', {
  callback = function() vim.cmd('normal zR') end,
})

----------------------------------------
-- colors
----------------------------------------

----------------------------------------
-- trailing whitespace highlight
----------------------------------------

vim.cmd([[
highlight ExtraWhitespace ctermbg=Red guibg=Red
]])

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function() vim.fn.matchadd('ExtraWhitespace', '\\s\\+$') end,
})

----------------------------------------
-- Ruby indentation
----------------------------------------

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    o.expandtab = true
    o.softtabstop = 2
    o.shiftwidth = 2
    o.tabstop = 2
  end,
})

----------------------------------------
-- rust
----------------------------------------

vim.g.rustfmt_autosave = 1

----------------------------------------
-- telescope
----------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
