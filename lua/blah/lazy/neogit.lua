return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function ()
        local neogit = require'neogit'
        neogit.setup({})

        vim.keymap.set("n", "tng", ":Neogit<cr>")
        vim.keymap.set("n", "tnp", ":Neogit push<cr>")
    end
}
