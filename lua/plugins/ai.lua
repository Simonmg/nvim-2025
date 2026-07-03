return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if opts.ensure_installed and not vim.tbl_contains(opts.ensure_installed, "yaml") then
            table.insert(opts.ensure_installed, "yaml")
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
    config = function()
      local api_key = vim.env.OPENROUTER_API_KEY
      if not api_key then
        vim.notify("OPENROUTER_API_KEY no encontrada. Configura la variable de entorno.", vim.log.levels.WARN)
      end

      require("codecompanion").setup({
        -- 1. Vincular estrategias al adaptador HTTP personalizado
        strategies = {
          chat = { adapter = "openrouter" },
          inline = { adapter = "openrouter" },
        },
        -- 2. Declarar de forma estricta bajo la clave 'http'
        adapters = {
          http = {
            openrouter = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url = "https://openrouter.ai/api/v1",
                  api_key = api_key or "",
                  chat_url = "/chat/completions",
                },
                schema = {
                  model = {
                    default = "cohere/north-mini-code:free",
                  },
                },
              })
            end,
          },
        },
      })
    end,
  },
}
