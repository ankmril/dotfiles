local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require ("vim-options")
require("lazy").setup("plugins")

vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

" Tumhare existing plugins yahan
Plug 'tpope/vim-sensible'

" Add Shadotheme
Plug 'Shadorain/shadotheme'

call plug#end()
]]

vim.o.termguicolors = true  -- enable true colors
vim.cmd('colorscheme shado')