vim.g.mapleader = " "
vim.g.localmapleader = " "

local set = vim.opt

-- Line Numbers
set.number = true
set.relativenumber = true

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.shiftround = true

-- Cursor
set.cursorline = false
set.mouse="a"

-- Search
set.hlsearch = true
set.incsearch = true
set.smartcase = true

-- Window
set.scrolloff = 10
set.sidescrolloff = 8
set.encoding="utf-8"
set.title = true
set.colorcolumn="80"
set.nowrap = true
set.termguicolors = true

-- Folding
set.foldmethod="indent"
set.foldnestmax = 3
set.foldenable = true
