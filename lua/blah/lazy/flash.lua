-- this plugin forces u to use lazy like tihs and i hate it
-- just cant have tings to be uniform

local highlight = {
    backdrop = true
}
local labels = "aoeuhtns.pgc"

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        -- home row of dworak
        labels = ".pgcaoeuhtns",
        search = {
            mode = "match",
        },
        highlight = highlight,
        label = {
            uppercase = false,
            rainbow = {
                enabled = true
            }
        },
        modes = {
            char = {
                enabled = false,
            },
        },
        treesitter = {
            labels = ".pgcaoeuhtns",
            label = {
                before = false
            }
        }
    },
    keys = {
        { "<leader>s", mode = { "n", "x", "o" }, 
            function() require("flash").jump() end, desc = "Flash" },
        { "<leader>S", mode = { "n", "x", "o" }, 
            function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
}
