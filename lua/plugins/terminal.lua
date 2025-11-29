return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<c-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
    opts = function(_, opts)
      opts.size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.2
        end
      end
      opts.open_mapping = false
      opts.direction = "float"
      opts.float_opts = {
        border = "curved",
      }
      opts.on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", {
          noremap = true,
          silent = true,
          desc = "Toggle terminal",
        })
      end
    end,
  },
}
