vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("set colorcolumn=80,100")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- Disable vim deprecated messages
vim.deprecate = function() end

-- Set winborder for mason issue
vim.o.winborder = "rounded"
