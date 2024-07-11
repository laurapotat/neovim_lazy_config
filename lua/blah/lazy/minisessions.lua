return {
    "echasnovski/mini.sessions",
    config = function ()
        local mini_sessions = require'mini.sessions'
        mini_sessions.setup({
            directory = vim.fn.stdpath('data') .. "/minisessions/"
        })

        function get_name()
            local toplevel = vim.fn.system({
                "git", 
                "rev-parse", 
                "--show-toplevel"
            })

            local start  = vim.fn.strridx(toplevel, "/") + 1
            local finish = vim.fn.strlen(toplevel)

            local proj_name = vim.fn.strpart(toplevel, start)

            -- XXX: it is important to trim whitespaces becuse mini espcapes 
            -- them intrenaly (ie a "\" gets added before each space)
            local proj_name, _ = tostring(proj_name):gsub("%s", "")
            return proj_name
        end

        function write() 
            mini_sessions.write(get_name())
        end

        function delete() 
            mini_sessions.delete(get_name(), { force = true })
        end

        vim.keymap.set('n', "<leader>tsc", write)
        vim.keymap.set('n', "<leader>tsd", delete)
    end
}
