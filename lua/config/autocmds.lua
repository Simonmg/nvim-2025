-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = { "Typescript", "TypescriptReact", "json", "javascript", ... },
  callback = function()
    require("utils").blameVirtText()
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  pattern = { "Typescript", "TypescriptReact", "json", "javascript", ... },
  callback = function()
    require("utils").clearBlameVirtText()
  end,
})

vim.api.nvim_create_autocmd({ "CursorMovedI" }, {
  pattern = { "Typescript", "TypescriptReact", "json", "javascript", ... },
  callback = function()
    require("utils").clearBlameVirtText()
  end,
})
