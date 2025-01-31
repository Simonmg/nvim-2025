return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "rest-nvim/rest.nvim",
    config = function()
      require("rest-nvim").setup({})

      local function deepseek_search(query)
        local api_key = "sk-f8bf21cc4c5d4594b3ee9cc296e57f50"
        if not api_key then
          vim.notify("DeepSeek API key not fount. Please set the api in the environtment", vim.log.levels.ERROR)
          return
        end

        local url = "https://api.deepseek.com/v1/search"
        local headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer " .. api_key,
        }

        local body = vim.fn.json_encode({
          query = query,
        })

        local request = require("plenary.curl").request({
          url = url,
          method = "post",
          headers = headers,
          body = body,
        })

        if request.status == 200 then
          local response = vim.fn.json_decode(request.body)

          print("Resultado: " .. vim.inspect(response), vim.log.levels.INFO)
        else
          print("Resultado fallido: " .. request.body, vim.log.levels.ERROR)
        end
      end

      vim.api.nvim_create_user_command("HelloWorld", function()
        print("¡Hola, mundo!")
      end, { desc = "Muestra un mensaje de 'Hola, mundo'" })

      vim.api.nvim_create_user_command("DeepSeekSearch", function(opts)
        deepseek_search(opts.args)
      end, { nargs = 1 })
    end,
  },
}
