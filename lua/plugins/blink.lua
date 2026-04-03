return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "super-tab"
      return opts
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      "fang2hou/blink-copilot",
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              max_completions = 1,
              debounce = 750,
              auto_refresh = { backward = true, forward = true },
            },
          },
        },
      },
    },
  },
}
