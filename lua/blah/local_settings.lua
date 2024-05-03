-- settings for specific file types!
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {"*.gleam"},
    callback = function(ev)
        -- set tabs to be 2 spaces big
        vim.opt_local.tabstop=4
        vim.opt_local.softtabstop=4
        vim.opt_local.shiftwidth=4
    end
})


