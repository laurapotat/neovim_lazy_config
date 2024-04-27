vim.cmd [[ autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE ]]

vim.cmd [[ autocmd ColorScheme * highlight @variable ctermfg=NONE guifg=NONE ]]
vim.cmd [[ autocmd ColorScheme * highlight @parameter ctermfg=NONE guifg=NONE ]]
vim.cmd [[ autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE ]]

vim.cmd [[ autocmd ColorScheme * highlight Comment gui=italic ]]

vim.cmd [[ autocmd ColorScheme * highlight Pmenu guibg=#e8e8e8 ]]
vim.cmd [[ autocmd ColorScheme * highlight Pmenu guibg=#000000 ]]

vim.cmd [[ autocmd InsertEnter * :set cursorline ]]
vim.cmd [[ autocmd InsertLeave * :set nocursorline ]]
