return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },

    dependencies = {
        "dcampos/nvim-snippy",
        "dcampos/cmp-snippy",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "honza/vim-snippets"
    },

    opts = function()
        local cmp = require("cmp")
        local snippy = require("snippy")
        return {
            snippet = {
                expand = function(args)
                    snippy.expand_snippet(args.body)
                end
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "snippy" },
                { name = "nvim_lsp_signature_help" }
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },

            mapping = {
               ["<Tab>"] = cmp.mapping(function(fb)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif snippy.can_expand_or_advance() then
                        snippy.expand_or_advance()
                    else
                        fb()
                    end
                end, { "i", "s" }),

                ["<CR>"] = cmp.mapping(function(fb)
                    if cmp.visible() and cmp.get_active_entry() then
                        cmp.confirm({ behaviour = cmp.ConfirmBehaviour, select = false })
                    else
                        fb()
                    end
                end, { "i" })
            }
        }
    end
}
