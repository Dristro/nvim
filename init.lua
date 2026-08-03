-- Set leader key
vim.g.mapleader = ' '

-- Let vim.keymap.set() take a description string in place of the opts table,
-- e.g. vim.keymap.set('n', '<leader>w', ':w<CR>', 'Save file')
do
    local orig_set = vim.keymap.set
    vim.keymap.set = function(mode, lhs, rhs, opts)
        if type(opts) == 'string' then
            opts = { desc = opts }
        end
        orig_set(mode, lhs, rhs, opts)
    end
end

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
vim.keymap.set("x", "p", "P", "Paste without losing paste register")


-- Basic keymaps
vim.keymap.set('n', '<leader>w', ':w<CR>', 'Save file')
vim.keymap.set('n', '<leader>q', ':q<CR>', 'Quit')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, 'LSP: format buffer')
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, 'Show line diagnostics')
vim.api.nvim_set_keymap(
    'n',
    '<loader>gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true, desc = 'LSP: go to definition' }
)

vim.keymap.set('n', '<leader>fs', '<cmd>Telescope treesitter<CR>', 'Find symbols')

-- Terminal stuff
vim.keymap.set('n', '<leader>t', function()
    vim.cmd('belowright split | terminal')

    -- resize to 70% of current window height
    local h = math.floor(vim.api.nvim_win_get_height(0) * 0.7)
    vim.cmd('resize ' .. h)
end, 'Open terminal (bottom split)')

-- Navigation
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { silent = true, desc = 'Focus window left' })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { silent = true, desc = 'Focus window below' })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { silent = true, desc = 'Focus window above' })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { silent = true, desc = 'Focus window right' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], 'Exit terminal mode')

-- Navigation stuff (move bw windows or buffers ig)
vim.keymap.set('n', '<leader>h', [[<C-\><C-n><C-w>h]], { silent = true, desc = 'Focus window left' })
vim.keymap.set('n', '<leader>j', [[<C-\><C-n><C-w>j]], { silent = true, desc = 'Focus window below' })
vim.keymap.set('n', '<leader>k', [[<C-\><C-n><C-w>k]], { silent = true, desc = 'Focus window above' })
vim.keymap.set('n', '<leader>l', [[<C-\><C-n><C-w>l]], { silent = true, desc = 'Focus window right' })

-- BufferLine keymaps
vim.keymap.set('n', '<leader>n', '<Cmd>BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>p', '<Cmd>BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' })
vim.keymap.set("n", "<leader>x", function()
    local current = vim.api.nvim_get_current_buf()
    vim.cmd("BufferLineCycleNext")
    -- if cycling didn't change buffer (e.g. last buffer),
    -- go to previous instead
    if vim.api.nvim_get_current_buf() == current then
        vim.cmd("BufferLineCyclePrev")
    end

    vim.cmd("bdelete " .. current)
end, { silent = true, desc = 'Close current buffer' })

-- Don't show '~' for empty lines
vim.opt.fillchars = { eob = " " }

-- Load config(s)
require('config.lazy')
require('config.lsp')
require('config.window')
