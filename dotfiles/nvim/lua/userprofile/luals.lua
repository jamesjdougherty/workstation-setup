local luals_root_path = '/home/dardeep/tools/lua-language-server'
local luals_binary = luals_root_path .. '/bin/lua-language-server'

require 'lspconfig'.lua_ls.setup {
    cmd = { luals_binary, '-E', luals_root_path .. '/main.lua' };
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
