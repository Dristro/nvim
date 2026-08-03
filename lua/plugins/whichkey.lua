return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",  -- or "modern" / "helix"
    delay = 700,
    -- show the popup right away for operator-pending etc. instead of
    -- waiting for one more key
    defer = function(ctx) return false end,
    triggers = {
      { "<auto>", mode = "nxsot" },  -- every prefix, in these modes
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer local keymaps",
    },
  },
}
