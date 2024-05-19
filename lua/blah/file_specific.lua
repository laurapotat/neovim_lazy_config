-- settings for specific file types


vim.api.nvim_create_augroup("FileSpecific", {})
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {"*.gleam"},
    group = "FileSpecific",
    callback = function(ev)
        -- set tabs to be 4 spaces big (lsp sets them to be 2)
        vim.opt_local.tabstop=4
        vim.opt_local.softtabstop=4
        vim.opt_local.shiftwidth=4
    end
})

-- disable afwul autoformat. was very confused at first because this 
-- is enabled without me installing anytihng other than the zig compiler :(
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.zig"},
    callback = function ()
        -- like actually wtf i never instaleld any extensions
        -- i cant find it with find ~/* -name "*zig*" and 
        -- there is only documentation on a page that says that you
        -- need to install it im so confused ?
        vim.cmd [[ let g:zig_fmt_autosave = 0 ]]
    end
})

