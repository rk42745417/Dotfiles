require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()

-- -------------------- LSP ----------------------------
--
-- require("mason-lspconfig").setup_handlers {
--     -- The first entry (without a key) will be the default handler
--     -- and will be called for each installed server that doesn't have
--     -- a dedicated handler.
--     function (server_name) -- default handler (optional)
--         vim.lsp.enable('server_name')
--     end,
--     -- Next, you can provide a dedicated handler for specific servers.
--     -- For example, a handler override for the `rust_analyzer`:
--     --["rust_analyzer"] = function ()
--     --    require("rust-tools").setup {}
--     --end
-- }

-------------------- LINTER ----------------------------

require("mason-nvim-lint").setup()
