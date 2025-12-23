-- Set leader key
vim.g.mapleader = ' '

-- Basic options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 4        -- Indent size
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'  -- Rishi said its not needed :)
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true


-- Basic keymaps
vim.keymap.set('n', '<leader>w', ':w<CR>')            -- Save
vim.keymap.set('n', '<leader>q', ':q<CR>')            -- Quit
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format) -- Apply LPS formatting
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)  -- Open LSP 'issues'
vim.api.nvim_set_keymap(
    'n',
    '<loader>gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true }
) -- Get definition of symbol

vim.keymap.set('n', '<leader>fs', '<cmd>Telescope treesitter<CR>')

-- Terminal stuff
-- vim.keymap.set('n', '<leader>t', ':belowright split | terminal<CR>')
vim.keymap.set('n', '<leader>t', function()
    vim.cmd('belowright split | terminal')

    -- resize to 70% of current window height
    local h = math.floor(vim.api.nvim_win_get_height(0) * 0.7)
    vim.cmd('resize ' .. h)
end)

-- Navigation
local opts = { silent = true }

vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]]) -- Close/termintion

vim.keymap.set('n', '<leader>h', [[<C-\><C-n><C-w>h]], opts)
vim.keymap.set('n', '<leader>j', [[<C-\><C-n><C-w>j]], opts)
vim.keymap.set('n', '<leader>k', [[<C-\><C-n><C-w>k]], opts)
vim.keymap.set('n', '<leader>l', [[<C-\><C-n><C-w>l]], opts)

-- vim.opt.showtabline = 2
-- vim.opt.termguicolors = true

-- Load config(s)
require('config.lazy')
require('config.lsp')
require('config.window')
