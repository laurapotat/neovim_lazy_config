local H = {}
local enabled = false

--- whether value is in the array
--- @param tab table
--- @param value any
function H.contains(tab, value) 
    for _, element in ipairs(tab) do 
        if element == value then 
            return true
        end
    end
    return false
end

--- get all the local marks and return them as an array of 
--- { line = <N>, hl_group = <HL> }
local function mark_integration()
    local ret = {}
    -- get the mark list
    local buffer_number = vim.fn.bufnr("%")
    local local_marklist = {}
    vim.list_extend(local_marklist, vim.fn.getmarklist(buffer_number))

    local special_marks = { "'<", "'>", "'.", "'[", "']", "'`", "''", "'\"", "'^" }

    local count = 1
    for i, mark_tab in ipairs(local_marklist) do
        -- skip special marks 
        if H.contains(special_marks, mark_tab.mark) then
            goto continue
        end

        -- update the return array
        ret[count] = { line = mark_tab.pos[2], hl_group = "Structure" } 
        count = count + 1

        ::continue::
    end

    return ret
end

local function get_filetype() 
    local file = vim.fn.expand("%:e")
    return tostring(file)
end

return {
    'echasnovski/mini.map',
    config = function () 
        local mini_map = require('mini.map')
        mini_map.setup({
            symbols = {
            },
            window = {
                width = 12,
            },
            integrations = {
                mini_map.gen_integration.diagnostic(),
                mini_map.gen_integration.builtin_search(),
                mark_integration
            }
        })
       
        vim.keymap.set('n', "<leader>tm", mini_map.toggle)


        local disabled_filetypes = { "md" }
        if enabled and not H.contains(disabled_filetypes, get_filetype()) then
            mini_map.open()
        end
    end
}
