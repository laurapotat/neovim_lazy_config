return {
    "echasnovski/mini.align",
    config = function ()
        require('mini.align').setup({
            mappings = {
                start = "<leader>gA",
                start_with_preview = "<leader>ga"
            },
        })

    end
}
