-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- New tab
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tc", ":tabclose<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Eslint
keymap.set("n", "fa", ":EslintFixAll<Return>", opts)
-- Prettier
keymap.set("n", "fp", ":Perttier<Return>", opts)

-- Select all --
keymap.set("n", "aa", "ggVG")
