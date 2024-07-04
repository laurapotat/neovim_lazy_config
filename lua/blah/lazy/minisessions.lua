return {
    "echasnovski/mini.sessions",
    config = function ()
        local mini_sessions = require'mini.sessions'
        mini_sessions.setup({
            directory = vim.fn.stdpath('data') .. "/minisessions/"
        })

        vim.keymap.set('n', "<leader>ts", ":lua MiniSessions.write()")
    end
}
