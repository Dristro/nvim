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
	            visible = false,
	            show_hidden_count = true,
	            hide_dotfiles = false,
	            hide_gitignored = false,
            	hide_by_name = {
	                ".git",
	                ".DS_Store",
	            },
            },
	        never_show = {},
        },
    },
    lazy = false,
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
    end
}
