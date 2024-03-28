return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason.nvim" },
        { "folke/neodev.nvim", opts = {} }
    },

    config = function()
        local lspconfig = require("lspconfig")
        local caps = require("cmp_nvim_lsp").default_capabilities()

        vim.diagnostic.config({
            virtual_text = false,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        lspconfig.lua_ls.setup { capabilities = caps }

        lspconfig.omnisharp.setup { capabilities = caps }

        lspconfig.ols.setup {
            capabilities = caps,
            init_options = {
                enable_format = true,
                enable_hover = true,
                enable_snippets = false,
                enable_semantic_tokens = true,
                enable_document_symbols = true,
                enable_fake_methods = false,
                enable_inlay_hints = false,
                enable_procedure_snippet = false
            }
        }

        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
    end,

    on_attach = {
        vim.keymap.set("n", "gd", vim.lsp.buf.definition),
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename),
        vim.keymap.set("n", "<space>f", vim.lsp.buf.format),
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action),
        vim.keymap.set("n", "K", vim.lsp.buf.hover),
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help),
    }
}
