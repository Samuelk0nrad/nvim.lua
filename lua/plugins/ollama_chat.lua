return {
  {
    "Lostexee/ollama-chat.nvim",
    dependencies = {
      -- Optional but recommended for Markdown rendering in the chat
      {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
      },
    },
    config = function()
      require("ollama-chat").setup({
        -- configuration goes here, all options are optional
        host = "localhost:11434",
      })
    end,
  },
}
