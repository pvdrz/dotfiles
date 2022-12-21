local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require 'lspconfig'

local default_settings = {
    ["rust-analyzer"] = {
        rustcSource = "discover",
        cargo = {
            loadOutDirsFromCheck = true,
            allFeatures = true,
            runBuildScripts = true,
        },
        procMacro = {
            enable = true,
        },
        completion = {
            snippets = {
                some = {
                    postfix = "some",
                    body = "Some(${receiver})",
                    scope = "expr",
                },
                ok = {
                    postfix = "ok",
                    body = "Ok(${receiver})",
                    scope = "expr",
                },
                err = {
                    postfix = "err",
                    body = "Err(${receiver})",
                    scope = "expr",
                },
                unsafe = {
                    postfix = "unsafe",
                    body = "unsafe { ${receiver} }",
                    scope = "expr",
                },
                arc = {
                    postfix = "arc",
                    body = "Arc::new(${receiver})",
                    scope = "expr",
                    requires = "std::sync::Arc",
                },
            }
        },
    }
}

lspconfig.rust_analyzer.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name

        if string.strfind(path, "rust-for-linux/rust") ~= nil then
            client.config.settings["rust-analyzer"].checkOnSave.overrideCommand = { "python3", "x.py", "check", "--json-output" }
            client.config.settings["rust-analyzer"].rustfmt.overrideCommand = { "./build/x86_64-unknown-linux-gnu/stage0/bin/rustfmt", "--edition=2021" }
            client.config.settings["rust-analyzer"].procMacro.server = "./build/x86_64-unknown-linux-gnu/stage0/libexec/rust-analyzer-proc-macro-srv"
            client.config.settings["rust-analyzer"].procMacro.enable = true
            client.config.settings["rust-analyzer"].buildScripts.enable = true
            client.config.settings["rust-analyzer"].buildScripts.invocationLocation = "root"
            client.config.settings["rust-analyzer"].buildScripts.invocationStrategy = "once"
            client.config.settings["rust-analyzer"].buildScripts.overrideCommand = { "python3", "x.py", "check", "--json-output" }
            client.config.settings["rust-analyzer"].cargo.sysroot = "./build/x86_64-unknown-linux-gnu/stage0-sysroot"
            client.config.settings["rust-analyzer"].rustc.source = "./Cargo.toml"
        elseif string.strfind(path, "bindgen/rust-bindgen") ~= nil then
            client.config.settings["rust-analyzer"].cargo.allFeatures = false
        end

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        return true
    end,
    capabilities = capabilities,
    settings = default_settings,
})

lspconfig.clangd.setup({})

lspconfig.pylsp.setup({})
