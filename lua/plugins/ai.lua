return {
  {
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
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          ft = { "markdown", "codecompanion" },
        },
      },
    },
    opts = function()
      local api_key = os.getenv("OPENROUTER_API_KEY")
      if not api_key then
        vim.notify("OPENROUTER_API_KEY is not set!", vim.log.levels.WARN)
      end
      return {
        default_provider = "openai_endpoint",
        providers = {
          openai_endpoint = {
            endpoint = "https://openrouter.ai/api/v1",
            api_key = api_key,
            model_names = {
              default = "google/gemini-2.5-flash",
            },
          },
        },
      }
    end,
  },
}
