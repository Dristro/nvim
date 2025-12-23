return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    handler_opts = { border = "rounded" },

    floating_window = true,            -- show popup with docstring
    hint_enable = true,
    hint_prefix = "💡 ",
    hi_parameter = "LspSignatureActiveParameter",
    floating_window_above_cur_line = true,

    -- ⏱ Timing and trigger tuning
    always_trigger = false,            -- don't trigger on every keystroke
    timer_interval = 500,              -- wait 500 ms after trigger
    extra_trigger_chars = { "(" },     -- trigger only on '('
    check_client_handlers = true,
    auto_close_after = 5,              -- close popup after 5 s of inactivity
    toggle_key = "<M-x>",              -- optional manual toggle (Alt+x)
  },

  config = function(_, opts)
    local sig = require("lsp_signature")
    sig.setup(opts)

    -- Wait 500 ms before considering the user idle
    -- vim.o.updatetime = 500

    -- Optional: re-trigger signature only when typing '(' after identifier,
    -- ignoring auto-inserted ')'
    vim.api.nvim_create_autocmd("InsertCharPre", {
      callback = function(event)
        if event.char == "(" then
          vim.defer_fn(function()
            sig.signature()  -- trigger manually after slight delay
          end, 500)
        end
      end,
    })
  end,
}

