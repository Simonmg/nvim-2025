return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.2
      end
    end,
    open_mapping = [[<c-t>]],
    direction = "horizontal",
    on_open = function(term) end,
  },
}
