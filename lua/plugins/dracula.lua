return {
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        priority = 1000,
        config = function()
            require("dracula").setup({
                transparent_bg = false,
                colors = {
                    bg = "#0c0c0e",
                },
            })

            vim.cmd.colorscheme("dracula")
        end,
    },
}
