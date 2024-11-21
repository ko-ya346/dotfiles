local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python (Pyright)
lspconfig.pyright.setup({
    capabilities = capabilities,
})
-- Rust (rust-analyzer) 
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})
