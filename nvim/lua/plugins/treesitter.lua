return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        auto_install = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        main = "nvim-treesitter.configs",
        ensure_installed = {
            "lua", "vim", "markdown", "html", "bash", "python", "rust", "yaml", "json", "sql", "markdown_inline", "hcl"
        },
        opts = {
            highlight = { enable = true },
        --    autotag = { enable = true },
        },

    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "CursorMoved",
    },
    {
        "windwp/nvim-ts-autotag",
         -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
         -- event = "LazyFile",
         opts = {},
         config = function()
             require("nvim-ts-autotag").setup()
         end,
     },
}
