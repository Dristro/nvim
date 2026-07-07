return {
    "nvim-treesitter/nvim-treesitter",

    branch = "master",
    commit = "42fc28ba918343ebfd5565147a42a26580579482",

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",

                "python",
                "java",
                "rust",
                "c",
                "cpp",
                "javascript",
                "html",

                "markdown",
                "markdown_inline",
            },

            auto_install = true,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        })
    end,
}
