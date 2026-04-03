return {
  -- make LazyVim prefer inline Copilot instead of cmp/blink AI completions
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.g.ai_cmp = false
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-Right>",
          accept_line = "<M-S-Right>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
    },
  },
}
