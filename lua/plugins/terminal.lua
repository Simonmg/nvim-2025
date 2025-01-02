return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function(_, opts)
      opts.size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.2
        end
      end
      opts.open_mapping = [[<c-t>]]
      opts.direction = "float"
      opts.float_opts = {
        border = "curved",
      }

      opts.cmd = "tmux"
    end,
  },
}
