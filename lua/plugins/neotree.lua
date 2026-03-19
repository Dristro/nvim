return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        filesystem = {
            filtered_items = {
	            visible = true,
	            show_hidden_count = false,
	            hide_dotfiles = false,
	            hide_gitignored = false,
            	hide_by_name = {},
                never_show = {},
            },
        },
    },
    lazy = false,
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
    end
}
