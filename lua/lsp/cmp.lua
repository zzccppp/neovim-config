local cmp = require("cmp")


local cmpMapping=function (cmp)
        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        return {
            -- Completion appears
            ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            -- Cancel
            ["<A-,>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- Prev
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            -- Next
            ["<C-j>"] = cmp.mapping.select_next_item(),
            -- confirm
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace,
            }),
            -- Scrolling if the window has too much content
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            -- Custom code snippet to jump to next parameter
            ["<C-l>"] = cmp.mapping(function(_)
                if vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                end
            end, { "i", "s" }),

            -- Custom code snippet to jump to the previous parameter
            ["<C-h>"] = cmp.mapping(function()
                if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),

            -- Super Tab
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),
            -- end of super Tab
        }
    end

cmp.setup({
    -- Specify the snippet engine
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- Completion source
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },

        -- treesitter
        -- { name = "treesitter" },

        -- document-symbol
        { name = "nvim_lsp_document_symbol" },

        -- signature-help
        { name = "nvim_lsp_signature_help" },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },
    }, { { name = "buffer" }, { name = "path" } }),

    -- Shortcut settings
    mapping = cmpMapping(cmp),
    -- Display type icons with lspkind-nvim
    formatting = require("lsp.ui").formatting,
})

-- / Find mode uses buffer source
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- : Using path and cmdline sources in command line mode.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
