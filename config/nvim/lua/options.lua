-- set options
local set = vim.opt
local opt = vim.opt
local cmd = vim.cmd

-- colors and fonts
set.background = 'dark'
vim.cmd('colorscheme onedark')
vim.cmd('syntax enable')
set.tabstop=2
set.softtabstop=2
set.shiftwidth=2
set.expandtab=true
set.completeopt={'menuone','noinsert','noselect'}
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = true                    -- Disable line wrap

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
cmd 'source ~/.config/nvim/resize.vim'
