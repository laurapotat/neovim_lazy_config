
vim.keymap.set('v', "\\j", "Jgqq")

vim.keymap.set('v', "\\J", "J")

vim.keymap.set("n", "<C-t>", "<C-i>")


-- fix indent inside current {} block
vim.keymap.set("n", "\\e", "=a}<cr>")
vim.keymap.set('v', "\\e", "=<cr>")


vim.keymap.set("", "R", "r")

-- Y makes more sense to work like this instead of
-- coping current line
vim.keymap.set("", "Y", "y$")

-- open file explorer
vim.keymap.set("", "<leader>ex", ":Explore!<CR>")

-- remap line selection to _ so i don't have to press shift key
vim.keymap.set("n", "-", "V")
vim.keymap.set('v', "-", "<esc>")

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


-- focus split
vim.keymap.set("n", "`h", ":wincmd h<CR>")
vim.keymap.set("n", "`t", ":wincmd j<CR>")
vim.keymap.set("n", "`n", ":wincmd k<CR>")
vim.keymap.set("n", "`s", ":wincmd l<CR>")

-- resize split
vim.keymap.set("n", "<leader>=", ":vertical resize +8<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -8<CR>")

vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- quickfix list mappings
vim.keymap.set("n", "\\j", ":cnext<cr>")
vim.keymap.set("n", "\\k", ":copen<cr>")


-- go to the next bracket without stretching your hands
vim.keymap.set("", "mm", "%")

-- vim.keymap.set("", "<leader>c", "ciw")
-- vim.keymap.set("", "<leader>i", "ci")
-- vim.keymap.set("", "<leader>a", "ca")


-- go to the next tab
vim.keymap.set("n", "``", ":tabnext<cr>")
vim.keymap.set("n", "\\'", "1gt")
vim.keymap.set("n", "\\,", "2gt")
vim.keymap.set("n", "\\.", "3gt")
vim.keymap.set("n", "\\p", "4gt")

-- while C-c does get you out of insert mode it doesn't trigger "InsertLeave" thing
-- and this fixes it
vim.keymap.set("i", "<C-c>", "<esc>")



-- vim.keymap.set("", "f", "t")
-- vim.keymap.set("", "F", "T")
-- 
-- vim.keymap.set("", "t", "f")
-- vim.keymap.set("", "T", "F")

-- 
vim.keymap.set("n", "<leader>cd", ":cd %:h")

-- don't move cursor yfter yank in visual mode 
-- this should be default tbh
vim.keymap.set('v', "y", "ygv<esc>")

vim.keymap.set('v', "<leader><tab>", "$:s/ /\\r/gc")


function toggle_number()
  vim.opt.nu = not vim.opt.nu:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

vim.keymap.set("n", "<leader>n", toggle_number)
vim.keymap.set("i", "jj", "<esc>")


