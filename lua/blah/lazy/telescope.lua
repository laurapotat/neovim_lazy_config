function config_blah() 
    -- theme + some opts
    local no_preview = function()
        return require('telescope.themes').get_dropdown({
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
            previewer = false,
            prompt_title = false,
        })

    end

    -- open find_files on specific location
    local no_preview_cwd = function(cwd)
        local first = no_preview()
        first.cwd = cwd
        return first
    end

    local actions = require("telescope.actions")

    -- telescope sittings
    require('telescope').setup {
        theme = no_preview(),
        defaults = {
            mappings = {
                i = {
                    ["<Down>"] = "move_selection_next",
                    ["<Up>"] = "move_selection_previous",
                }
            },
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = ' >',
            color_devicons = true,

            file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        },
        extensions = {
            fzy_native = {
                override_generic_sorter = true,
                override_file_sorter = true,
            }
        }
    }

    require('telescope').load_extension('fzy_native')

    -- use find_files if git_files didn't found git repo
    function project_files ()
        local opts = no_preview()
        opts.show_untracked = true
        local ok = pcall(require'telescope.builtin'.git_files, opts)
        if not ok then require'telescope.builtin'.find_files(opts) end
    end

    -- open vim config files
    function vim_files()
        require("telescope.builtin").git_files(no_preview_cwd("~/.config/nvim"),{})
    end

    -- <-- builtin pickers with theme
    --- find files. 
    function ff()
	    require("telescope.builtin").find_files(no_preview(), {})
    end
    
    function gf()
        require("telescope.builtin").git_files(no_preview(), {})
    end
    function grep()
        require('telescope.builtin').live_grep(no_preview(), {})
    end
    function buffers() 
        require("telescope.builtin").buffers(no_preview(), {})
    end
    function treesitter() 
        require("telescope.builtin").treesitter(no_preview(), {})
    end
    -->

    vim.keymap.set("n", "<leader>tg", ff, { desc = " find files" })
    vim.keymap.set("n", "<leader>te", treesitter, { desc = " treesitter picker" })
    vim.keymap.set("n", "<leader>th", project_files, { desc = " treesitter picker" })
    vim.keymap.set("n", "<leader>tb", buffers, { desc = " open buffers picker" })
    vim.keymap.set("n", "<leader>vim", vim_files, { desc = " vim files picker" })

    vim.keymap.set("n", "<leader>ps", grep, { desc = " grep project", })

end

return {
    'nvim-telescope/telescope.nvim',
	dependencies = {'nvim-telescope/telescope-fzy-native.nvim'},

    config = config_blah
}
