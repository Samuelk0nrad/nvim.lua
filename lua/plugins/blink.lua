return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "fang2hou/blink-copilot",
    },
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "super-tab"

      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }
      table.insert(opts.sources.default, "copilot")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.copilot = vim.tbl_deep_extend("force", opts.sources.providers.copilot or {}, {
        name = "copilot",
        module = "blink-copilot",
        enabled = false,
        score_offset = 100,
        async = true,
        opts = {
          max_completions = 1,
          debounce = 750,
          auto_refresh = { backward = true, forward = true },
        },
      })

      return opts
    end,
  },
}
