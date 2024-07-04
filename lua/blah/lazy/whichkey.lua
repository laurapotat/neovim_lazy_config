return {
    'folke/which-key.nvim',

    config = function()
        require'which-key'.setup()

        vim.o.timeoutlen = 300
    end
}
