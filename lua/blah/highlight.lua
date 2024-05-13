-- vim.cmd [[ autocmd InsertEnter * :set cursorline ]]
-- vim.cmd [[ autocmd InsertLeave * :set nocursorline ]]

vim.api.nvim_create_augroup("FiletypeColors", {})

function set_colorscheme(colorscheme)
    vim.cmd("colorscheme " .. colorscheme)
    vim.cmd [[ highlight SignColumn ctermbg=NONE guibg=NONE ]]

    vim.cmd [[ highlight @variable ctermfg=NONE guifg=NONE ]]
    vim.cmd [[ highlight @parameter ctermfg=NONE guifg=NONE ]]
    vim.cmd [[ highlight SignColumn ctermbg=NONE guibg=NONE ]]

    vim.cmd [[ highlight Comment gui=italic ]]

    vim.cmd [[ highlight Pmenu guibg=#e8e8e8 ]]
    vim.cmd [[ highlight Pmenu guibg=#000000 ]]


    vim.cmd [[ highlight Normal ctermbg=NONE guibg=NONE ]]
end

--- create autocmd that sets colorscheme based on the filetype
function colorscheme(filetype, colorscheme)
    vim.api.nvim_create_autocmd("BufEnter", {
        group = "FiletypeColors",
        pattern = {"*" .. filetype},
        callback = function ()
            set_colorscheme(colorscheme)
        end
    })
end

   
colorscheme(".zig", "gruvbox")
colorscheme(".rs", "default")
set_colorscheme("gruvbox")
