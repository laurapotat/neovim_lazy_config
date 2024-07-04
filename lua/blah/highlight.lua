-- vim.cmd [[ autocmd InsertEnter * :set cursorline ]]
-- vim.cmd [[ autocmd InsertLeave * :set nocursorline ]]

local M = {}

vim.api.nvim_create_augroup("FiletypeColors", {})

function M.set_colorscheme(colorscheme)
    vim.cmd("colorscheme " .. colorscheme)
    vim.cmd [[ highlight SignColumn ctermbg=NONE guibg=NONE ]]

    vim.cmd [[ highlight @variable ctermfg=NONE guifg=NONE ]]
    vim.cmd [[ highlight @parameter ctermfg=NONE guifg=NONE ]]
    vim.cmd [[ highlight SignColumn ctermbg=NONE guibg=NONE ]]

    vim.cmd [[ highlight Pmenu guibg=#e8e8e8 ]]
    vim.cmd [[ highlight Pmenu guibg=#000000 ]]


    vim.cmd [[ highlight Normal ctermbg=NONE guibg=NONE ]]
end

--- create autocmd that sets colorscheme based on the filetype
function M.colorscheme(filetype, colorscheme)
    vim.api.nvim_create_autocmd("BufEnter", {
        group = "FiletypeColors",
        pattern = {"*" .. filetype},
        callback = function ()
            set_colorscheme(colorscheme)
        end
    })
end

vim.api.nvim_create_augroup("StatusLine", {})
vim.api.nvim_create_autocmd("BufEnter", {
    group = "StatusLine",
    pattern = {"*"},
    callback = function ()
        print(vim.fn.expand("%:."))
    end
})

   
M.colorscheme(".zig", "gruvbox")
-- colorscheme(".rs", "default")
M.set_colorscheme("gruvbox")

return M
