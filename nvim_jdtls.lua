return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    config = function ()
        require'jdtls'.start_on_attach({
        })
    end
}
