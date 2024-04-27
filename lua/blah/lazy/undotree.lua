return {
	'mbbill/undotree',
    config = function() 
        vim.keymap.set("n", "<leader>tr", ":UndotreeToggle<CR>")
        vim.keymap.set("v", "<leader>tr", ":UndotreeToggle<CR>")
    end
}
