-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- lazy vim sets these by default.
vim.opt.nu = true
-- vim.opt.relativenumber = true

-- -- lazy vim by default keeps it to 2, for the moment I like it.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- -- disable vim backups
vim.opt.swapfile = false
vim.opt.backup = false

-- persist undos of undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- -- lazy vim enables these parameters.
-- vim.opt.hsearch = true -- for highlighting seach terms.
-- vim.opt.incsearch = true -- highlights the search terms as we type.

vim.opt.scrolloff = 8 -- keep atleast 8 lines in the bottom (unless the end of file is less than 8 lines).

vim.opt.updatetime = 50 -- supposed to help with performance due to how many plugins rely on events pertaining to this flag.

vim.opt.colorcolumn = "120" -- column to measure line width.

vim.g.lazyvim_check_order = false -- disable since I'm using lazyvim only as a package manager.

-- merge vim and system clipboards.
vim.opt.clipboard = "unnamedplus" -- I tried avoiding doing this, but at this point I've given up hope.

-- TODO: Improve search.
-- TODO: Tabs and buffer management.

vim.cmd([[
  " highlight the cursor line.
  set cursorline
]])
