-- LSP configs

-- Diagnostic box customization
vim.diagnostic.config({
    float = {
        source = "always",
        border = "rounded",
    },
}) -- Show which LSP sourced issue

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0e0a14" })

