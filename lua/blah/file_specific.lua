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
