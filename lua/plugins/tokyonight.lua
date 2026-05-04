return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
        on_highlights = function(hl, c)
            hl.NeoTreeNormal = { bg = "none" }
            hl.NeoTreeNormalNC = { bg = "none" }
            hl.NeoTreeEndOfBuffer = { bg = "none" }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
