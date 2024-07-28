
function config_blah()
    -- setup completion 
    
    local cmp = require 'cmp'
    local lconf = require 'lspconfig'


    -- do not insert text when changing wihch item in completion list is
    -- selected
    local select_opt = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        completion = {
            --autocomplete = false,
            
            -- uncomment this for gdscript (it is veeeeery slow otherwise)
            -- keyword_length = 3
        },
        snippet = {
            -- specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            -- select next 
            ['<C-n>']  = cmp.mapping.select_next_item(select_opt),

            -- select prev
            ['<C-p>']  = cmp.mapping.select_prev_item(select_opt),

            -- show completion list on Ctrl+Space
            ['<C-space>'] = cmp.mapping.complete(),

            -- complete. this will could insert some things that you might not
            -- expect
            ['<C-h>']  = cmp.mapping.confirm({ select = false }),
        },

        sources = cmp.config.sources({
            { name = 'vsnip' },
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
        })
    })
  

    ----------------------------------------------------------------------------
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local shared_opts = {
        capabilities = capabilities
    }

    require 'mason'.setup()

    require 'mason-lspconfig'.setup {}

    local servers = {
        "rust_analyzer",
        "gdscript",
        "tsserver",
        "lua_ls",
        "cssls",
        "bashls",
        "angularls",
        "pyright", 
        "clangd",
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

    -- only add lsp binding when lps is loaded
    vim.api.nvim_create_autocmd("LspAttach", {
        pattern = {"*"},
        group = "LspGroup",
        callback = function (args)
            vim.keymap.set("n", "<leader>,", ":lua vim.diagnostic.open_float(nil, {focus=false})<cr>")
            vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
            vim.keymap.set("v", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
            vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")

            vim.keymap.set("n", "<leader>pd", ":lua vim.lsp.buf.definition()<cr>")
            vim.keymap.set("n", "<leader>pr", ":lua vim.lsp.buf.references()<cr>")

            vim.keymap.set("", "<leader>ph", ":lua vim.lsp.buf.hover()<cr>")

            vim.keymap.set("", "<leader>pn", ":lua vim.diagnostic.goto_next()<cr>")

            -- some lsps change tw, prevent that
            vim.opt.tw=79

            -- disable highlighting provided by the server
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            client.server_capabilities.semanticTokensProvider = nil
        end
      
    })
    
    ----------------------------------------------------------------------------

    -- minimal diangostics on the screen
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
    
    -- filetype specific _lsp_ settings 
    vim.api.nvim_create_augroup("LSaoPaulo", {})

    vim.api.nvim_create_autocmd("BufEnter", {
        group = "LSaoPaulo",
        pattern = {"*.java"},
        callback = function (args)
            diagnostics_config.signs = false
            vim.diagnostic.config(diagnostics_config)
        end
    })

    ----------------------------------------------------------------------------
    
    -- map snippets. 
    -- some servers provide snipets 
    -- but this will only work with manually created ones.
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
    config = config_blah
}
