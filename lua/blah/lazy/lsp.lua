
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


    ----------------------------------------------------------------------------
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local shared_opts = {
        capabilities = capabilities
    }

    require 'mason'.setup()

    require 'mason-lspconfig'.setup {}

    local servers = {
        "rust_analyzer",
        "tsserver",
        "lua_ls",
        "cssls",
        "bashls",
        "angularls",
        "pyright", 
        "docker_compose_language_service",
    }
    for _, server in ipairs(servers) do
        lconf[server].setup { shared_opts }
    end

    -- gleam is autoinstalled, shouldn't install it with mason!!
    lconf["gleam"].setup { shared_opts }
    lconf["zls"].setup {
        zig = {
            zls = {
                enableAutofix = true
            }
        }
    }

    ----------------------------------------------------------------------------

    vim.api.nvim_create_augroup("LspGroup", {})

    vim.api.nvim_create_autocmd("LspAttach", {
        pattern = {"*"},
        group = "LspGroup",
        callback = function (args)
            vim.keymap.set("n", "<leader>,", ":lua vim.diagnostic.open_float(nil, {focus=false})<cr>")
            vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
            vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
            vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>")

            vim.keymap.set("n", "<leader>pn", ":lua vim.diagnostic.goto_next()<cr>")

            vim.keymap.set("n", "<leader>pd", ":lua vim.lsp.buf.definition()<cr>")
            vim.keymap.set("n", "<leader>pr", ":lua vim.lsp.buf.references()<cr>")

            vim.keymap.set("", "<leader>ph", ":lua vim.lsp.buf.hover()<cr>")
            vim.keymap.set("", "<leader>gs", ":lua vim.lsp.buf.signature_help()<cr>")
            vim.opt.tw=79

            local client = vim.lsp.get_client_by_id(args.data.client_id)
            client.server_capabilities.semanticTokensProvider = nil
        end
      
    })
    
    ----------------------------------------------------------------------------

    local diagnostics_config = {
        virtual_text = false,
        signs = {
            -- only show errors
            severity = vim.diagnostic.severity.ERROR,
        },
        underline = false,
        update_in_insert = false,
        severity_sort = true,
    }
    vim.diagnostic.config(diagnostics_config)


    ----------------------------------------------------------------------------
    
    vim.api.nvim_create_augroup("LSaoPaulo", {})
    
    -- enable signes in gleam because ? idk i dont rember why i wanted them
    vim.api.nvim_create_autocmd("BufEnter", {
        group = "LSaoPaulo",
        pattern = {"*.gleam"},
        callback = function ()
            diagnostics_config.signs = {}
            vim.diagnostic.config(diagnostics_config)
        end
    })

    -- disable afwul autoformat. was very confused at first because this 
    -- is enabled without me installing anytihng other than the zig compiler :(
    vim.api.nvim_create_autocmd("BufEnter", {
        group = "LSaoPaulo",
        pattern = {"*.zig"},
        callback = function ()
            -- like actually wtf i never instaleld any extensions
            -- i cant find it with find ~/* -name "*zig*" and 
            -- there is only documentation on a page that says that you
            -- need to install it im so confused ?
            vim.cmd [[ let g:zig_fmt_autosave = 0 ]]
        end
    })
    
    ----------------------------------------------------------------------------
    
    vim.cmd [[ imap <expr> <C-h> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-h>' ]]
end




return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',

        -- snippets
        -- todo: i wana swap to other snippet engine
        -- primarily for TM_SELECTED_TEXT support
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
    opts= {autoformat = false},
    config = config_blah
}
