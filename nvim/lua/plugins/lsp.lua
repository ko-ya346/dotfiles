return {
    -- mason.nvim...LSPサーバー、フォーマッタ、リンター、デバッガなどのツールを管理するツール
    { 
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- プラグインの更新
        config = true, -- デフォルト設定を有効化
    },
    -- Mason とLSPConfig の連携
    { 
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "rust_analyzer" }, -- 必要なサーバーを指定
            })
        end,
    },
    -- 自動補完用プラグイン
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP ソース
            "hrsh7th/cmp-buffer", -- バッファ補完 ソース
            "hrsh7th/cmp-path", -- パス補完ソース
            "hrsh7th/vim-vsnip", -- スニペットエンジン
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp"},
                    { name = "buffer"},
                    { name = "path"},
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-l>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm { select = true },
                }),
                experimental = {
                    ghost_text = true,
                },
            })
        end,
    }
}
