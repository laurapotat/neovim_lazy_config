
-- split big line into small lines according to format options
vim.keymap.set('v', "\\j", "Jgqq")

-- unmap R
vim.keymap.set("", "R", "r")

-- copy between cursor and end of the line (could be default in neovim nowdays)
vim.keymap.set("", "Y", "y$")

-- open file explorer
vim.keymap.set("", "<leader>ex", ":Explore!<CR>")

-- remap line selection to _ so i don't have to press shift key
vim.keymap.set("n", "-", "V")
vim.keymap.set('v', "-", "<esc>")

-- go to the end of the buffer
vim.keymap.set("n", "ge", "G")
vim.keymap.set('v', "ge", "G")


-- copy to system clipboard 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")

-- delete witohut overwritng yank
vim.keymap.set("n", "<leader>x", "\"_x")
vim.keymap.set("x", "<leader>x", "\"_x")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

-- focus split (might delete due to flash.nvim)
vim.keymap.set("n", "`h", ":wincmd h<CR>")
vim.keymap.set("n", "`t", ":wincmd j<CR>")
vim.keymap.set("n", "`n", ":wincmd k<CR>")
vim.keymap.set("n", "`s", ":wincmd l<CR>")

-- move selected line up and down + fix indent
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

-- write buffer to the file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- quickfix list mappings
vim.keymap.set("n", "\\j", ":cnext<cr>")
vim.keymap.set("n", "\\k", ":copen<cr>")


-- go to the next bracket without stretching your hands
vim.keymap.set("", "mm", "%")

-- while C-c does get you out of insert mode it doesn't trigger "InsertLeave" thing
-- and this fixes it
vim.keymap.set("i", "<C-c>", "<esc>")


-- don't move cursor after yank in visual mode 
-- this should be default tbh
vim.keymap.set('v', "y", "ygv<esc>")

-- split line on comas
vim.keymap.set('v', "<leader><tab>", "$:s/, /,\\r/g")


function toggle_number()
  vim.opt.nu = not vim.opt.nu:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

-- vim.keymap.set("n", "<leader>n", toggle_number)
vim.keymap.set("i", "jj", "<esc>")

