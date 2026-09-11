return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    lazy = false,

    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {},
                never_show = {},
            },
        },
    },

    config = function(_, opts)
        require("neo-tree").setup(opts)

        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
    end,
}
