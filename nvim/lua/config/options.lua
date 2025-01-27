-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Set hybrid line numbers when inseting text
vim.cmd("autocmd InsertEnter * :set norelativenumber")
vim.cmd("autocmd InsertLeave * :set relativenumber")

opt.wrap = false -- disable line wrapping

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.clipboard:append({ "unnamed", "unnamedplus" }) -- use system clipboard as default register
