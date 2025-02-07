return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "rest-nvim/rest.nvim", -- Opcional, para manejar solicitudes HTTP
    config = function()
      local function deepseek_search(query)
        -- local api_key = os.getenv("sk-f8bf21cc4c5d4594b3ee9cc296e57f50") -- Asegúrate de tener tu clave en una variable de entorno
        local api_key = "sk-f8bf21cc4c5d4594b3ee9cc296e57f50"
        if not api_key then
          vim.notify("DeepSeek API key not found. Set the DEEPSEEK_API_KEY environment variable.", vim.log.levels.ERROR)
          return
        end

        local url = "https://api.deepseek.com/chat/completions" -- URL de la API de DeepSeek
        local headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer " .. api_key,
        }
        local body = vim.fn.json_encode({
          model = "deepseek-chat",
          messages = {
            { role = "system", content = "You are a helpful assistant." },
          },
          stream = false,
          -- Agrega otros parámetros según la documentación de la API
        })

        -- Usar plenary.nvim para hacer la solicitud HTTP
        local request = require("plenary.curl").request({
          url = url,
          method = "post",
          headers = headers,
          body = body,
        })

        if request.status == 200 then
          local response = vim.fn.json_decode(request.body)
          -- Procesar la respuesta y mostrar los resultados en Neovim
          vim.notify("DeepSeek results: " .. vim.inspect(response), vim.log.levels.INFO)
        else
          local response = vim.fn.json_decode(request.body)
          vim.print("Failed to fetch data from DeepSeek API: " .. response, vim.log.levels.ERROR)
        end
      end

      vim.api.nvim_create_user_command("DeepSeekSearch", function(opts)
        deepseek_search(opts.args)
      end, { nargs = 1 })

      -- Opcional: Asignar un atajo de teclado
      vim.keymap.set("n", "<leader>ds", ":DeepSeekSearch ", { desc = "Search code snippets with DeepSeek" })
    end,
  },
}
