local lsps = {
    "lua_ls",        -- LUA
    "clangd",        -- C
    "ruff",          -- Python
    "pylsp",         -- Python
    "pyright",       -- Python
    "pyrefly",       -- Python
    "rust_analyzer", -- RUST
    "biome",         -- JSON / JS / TS
    "ts_ls",         -- TypeScript
    "omnisharp",     -- C#
    "jdtls",         -- Java
    "sqlls",         -- SQL
    "htmx",          -- htmx
    "cssls",         -- CSS
    "texlab",        -- LaTex
    "marksman",      -- Markdown
}


return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = lsps
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        vim.lsp.enable(lsps),
    },
}
