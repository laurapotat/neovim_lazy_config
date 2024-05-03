return {
    "folke/flash.nvim",
    config = function ()
        local flash = require'flash'
        vim.keymap.set("", "s", "<nop>")
        vim.keymap.set("", "S", "<nop>")
        vim.keymap.set("n", "s", function () flash.jump() end)
        vim.keymap.set("n", "S", function () flash.treesitter() end)
    end
}
