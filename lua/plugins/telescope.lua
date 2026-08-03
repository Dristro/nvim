return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Telescope settings | Fuzzy Finding
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Fuzzy grep" })
    end
}
