vim.g.mapleader=" "

vim.opt.splitright=true
vim.opt.splitbelow=true

-- max height of menu
vim.opt.pumheight=10

vim.opt.laststatus=1

-- let vim vim.opt.the title of the terminal window
vim.opt.title=true

vim.opt.showcmd=false

-- do not show which current mode (Insert, Visual etc)
vim.opt.showmode=false

-- change directory when opening a differnt file
-- vim.opt.autochdir=true

-- cursor position at teh bottom of the terminl
vim.opt.ruler=false

-- do not highlight things that match search
vim.opt.hlsearch=false

-- line numbers
vim.opt.relativenumber=true
vim.opt.nu=true

-- max width of number column
vim.opt.nuw=3

-- vim.opt.tabs to be 4 spaces wide
vim.opt.tabstop=4 
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

-- spaces instead of tabs
vim.opt.expandtab=true

vim.opt.backup=false

-- swap file is basically backup
vim.opt.swapfile=false

-- keeep undo between relunches
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

-- at which char format line (wouldn't split words in half cuz of format
-- options)
local tw = 79
vim.opt.tw=tw
vim.opt.colorcolumn=tostring(tw+1)

-- text fromat options
-- ':h fo-table' for more info
vim.opt.formatoptions='tc1rqnj'

-- ignore case in search patterns
-- vim.opt.ignorecase=true

-- repeating timeout kinda thing, used to do something each timeout tick kinda
-- thing
vim.opt.timeout = true
vim.opt.timeoutlen = 750
