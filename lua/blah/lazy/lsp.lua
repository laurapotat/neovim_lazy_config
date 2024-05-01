function config_blah()
    local cmp = require 'cmp'
    local lconf = require 'lspconfig'


    local select_opt = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
        completion = {
            -- keyword_length =  1,
            -- autocomplete = true,
        },
        snippet = {
            -- specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-n>']  = cmp.mapping.select_next_item(select_opt),
            ['<Down>'] = cmp.mapping.select_next_item(select_opt),
            ['<C-p>']  = cmp.mapping.select_prev_item(select_opt),
            ['<Up>']   = cmp.mapping.select_prev_item(select_opt),
            -- ['<tab>'] = cmp.mapping.confirm({ select = true }),
            ['<C-h>']  = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
            { name = 'vsnip' },
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
        })

    })
    -- i've heard this is required bc copilots plugin sucks
    cmp.mapping["<tab>"] = nil
    cmp.mapping["<S-tab>"] = nil

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local servers = {
        "pyright",
        "jdtls",
        "rust_analyzer",
        "tsserver",
        "cssls",
        "lua_ls",
        "bashls",
        "angularls",
    }

    local shared_opts = {
        capabilities = capabilities
    }

    require 'mason'.setup()
    require 'mason-lspconfig'.setup {
        ensure_installed = servers
    }

    for _, server in ipairs(servers) do
        lconf[server].setup { shared_opts }
    end
    -- gleam is autoinstalled, shouldn't install it with mason!!
    lconf["gleam"].setup { shared_opts }


    vim.diagnostic.config({
        virtual_text = false,
        signs = {
            -- only show errors
            severity = vim.diagnostic.severity.ERROR,
        },
        underline = false,
        update_in_insert = false,
        severity_sort = true
    })

    vim.keymap.set("n", "<leader>,", ":lua vim.diagnostic.open_float(nil, {focus=false})<cr>")
    vim.keymap.set("n", "<leader>oi", ":lua vim.lsp.buf.code_action()<cr>")
    vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
    vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>")

    vim.keymap.set("n", "<leader>pn", ":lua vim.diagnostic.goto_next()<cr>")

    vim.keymap.set("n", "<leader>pd", ":lua vim.lsp.buf.definition()<cr>")
    vim.keymap.set("n", "<leader>pr", ":lua vim.lsp.buf.references()<cr>")

    vim.keymap.set("", "<leader>ph", ":lua vim.lsp.buf.hover()<cr>")
    vim.keymap.set("", "<leader>gs", ":lua vim.lsp.buf.signature_help()<cr>")

    -- idk how to do that in lua only
    vim.opt.tw=79
    vim.cmd [[ imap <expr> <C-h> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<tab>h' ]]
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        -- snippets
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'hrsh7th/cmp-vsnip',

        -- completion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        -- mason
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    config = config_blah
}
