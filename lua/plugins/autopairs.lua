return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true -- This will call require("nvim-autopairs").setup{}
                  -- You can also pass a table here for custom options, e.g., config = { map_bs = false }
}

