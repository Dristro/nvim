return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Treesitter settings | Parsing and syntax highlighing
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
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
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
