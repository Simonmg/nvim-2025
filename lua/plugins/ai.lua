return {
  { -- Plugin: olimorris/codecompanion.nvim
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if opts.ensure_installed then
            vim.list_extend(opts.ensure_installed, { "yaml" })
          end
        end,
      },
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
      default_provider = "openai_endpoint",
      providers = {
        openai_endpoint = {
          endpoint = "https://openrouter.ai/api/v1",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          model_names = {
            default = "google/gemini-2.5-flash",
          },
        },
      },
    },
  },
  { -- Plugin: MeanderingProgrammer/render-markdown.nvim
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      ft = { "markdown", "codecompanion" },
    },
    ft = { "codecompanion" },
  },
}
