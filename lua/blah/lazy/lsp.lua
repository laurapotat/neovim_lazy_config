function config_blah()
    local cmp = require'cmp'
    local lconf = require'lspconfig'


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
            ['<C-n>']  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Down>']  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-p>']  = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>']  = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<tab>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'vsnip' },
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
        })

      })
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require'mason'.setup()
    require'mason-lspconfig'.setup {
        ensure_installed = {
            "pyright",
            "jdtls",
            "rust_analyzer",
            "ocamllsp",
            "clangd",
            "tsserver",
            "cssls",
        }
    }

    lconf.pyright.setup{capabilities = capabilities}
    lconf.jdtls.setup{capabilities = capabilities}
    lconf.rust_analyzer.setup{capabilities = capabilities}
    lconf.ocamllsp.setup{capabilities = capabilities}
    lconf.clangd.setup{capabilities = capabilities}
    lconf.tsserver.setup{capabilities = capabilities}
    lconf.cssls.setup{capabilities = capabilities}

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
    vim.keymap.set("n", "<leader>fr", ":lua vim.lsp.buf.format()<cr>")

    vim.keymap.set("n", "<leader>pn", ":lua vim.diagnostic.goto_next()<cr>")

    vim.keymap.set("n", "<leader>pd", ":lua vim.lsp.buf.definition()<cr>")
    vim.keymap.set("n", "<leader>pr", ":lua vim.lsp.buf.references()<cr>")

    vim.keymap.set("", "<leader>ph", ":lua vim.lsp.buf.hover()<cr>")
    vim.keymap.set("", "<leader>gs", ":lua vim.lsp.buf.signature_help()<cr>")

    -- idk how to do that in lua only
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
