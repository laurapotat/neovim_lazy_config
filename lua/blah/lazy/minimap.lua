return {
    'echasnovski/mini.map',

    config = function () 
        local mini_map = require('mini.map')
        mini_map.setup({
            symbols = {
                scroll_line = "┃"
            },
            window = {
                wdith = 12,
            }
        })
        vim.keymap.set('n', "<leader>tm", mini_map.toggle)

        mini_map.open()
    end
}
