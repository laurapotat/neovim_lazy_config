return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            local gruvbox = require 'gruvbox'
            gruvbox.setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    ["@comment"] = { 
                        fg = gruvbox.palette.neutral_blue,
                    },
                    --<------------------------------------------------ 
                    -- this is nightly version things. 
                    ["@comment.todo"] = { 
                        fg = gruvbox.palette.ligth0,
                    },
                    ["@comment.note"] = { 
                        fg = gruvbox.palette.ligth0 ,
                    },
                    ["@comment.error"] = { 
                        fg = gruvbox.palette.neutral_red ,
                    },
                    ["@comment.warning"] = { 
                        fg = gruvbox.palette.neutral_orange ,
                    },
                    ["@comment.documentation"] = {
                        fg = gruvbox.palette.neutral_orange,
                    },
                    --------------------------------------------------->
                },
                dim_inactive = false,
                transparent_mode = false,
            })
            -- vim.cmd("colorscheme gruvbox")
        end
    },
}
