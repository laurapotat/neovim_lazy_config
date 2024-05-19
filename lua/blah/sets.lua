-- set keymap leader key
vim.g.mapleader=" "

-- splits appear on the right and bottom side of the window
vim.opt.splitright=true
vim.opt.splitbelow=true

-- max height of menus
vim.opt.pumheight=10

-- the status line on the bottom of the screen
-- 0 -> no status line
-- 1 -> only when there are multiple files
-- 2 -> always
-- 4 -> only the last(closest to the bottom) window 
vim.opt.laststatus=1

-- let vim vim.opt.the title of the terminal window
vim.opt.title=true

-- 
vim.opt.showcmd=false

-- do not show which current mode (Insert, Visual etc)
vim.opt.showmode=false

-- cursor position at teh bottom of the window
vim.opt.ruler=false

-- do not highlight things that match search
vim.opt.hlsearch=false

-- line numbers on the left
vim.opt.relativenumber=true
vim.opt.nu=true

-- max width of number column on the left
vim.opt.nuw=3

-- set tabs to be 4 spaces wide
vim.opt.tabstop=4 
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

-- use spaces instead of tabs
vim.opt.expandtab=true

-- backup file
vim.opt.backup=false
vim.opt.swapfile=false

-- save undo history
vim.opt.undodir='/home/laura/.vim/undodir'
vim.opt.undofile=true
vim.opt.undolevels=10000

-- do not wrap text when it doesn't fit on line
vim.opt.wrap=false

-- scroll not when cursor reaches very bottom on window but a bit higher
vim.opt.scrolloff=10

-- sign column on the right of the line numbers,
-- lps will put error and warrning icons there
vim.opt.signcolumn='yes'

-- enable better color support
vim.opt.termguicolors=true

-- do not delete 4 spaces when pressing backspace (as if they were a tab)
vim.opt.smarttab=false

-- mouse support in normal, visual and insert mode
vim.opt.mouse='nvi'

-- at which char format line 
local tw = 79
vim.opt.tw=tw
-- color line at the right
vim.opt.colorcolumn=tostring(tw+1)

-- text fromat options
-- ':h fo-table' for more info
vim.opt.formatoptions='tc1rqnj'


