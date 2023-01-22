local M = {}

local lsp_keymappings = {
    normal_mode = {
        ["gD"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
        ["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
        ["gk"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
        ["gi"] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
        ["gr"] = "<Cmd>lua vim.lsp.buf.references()<CR>",
        ["<C-k>"] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
        ["[d"] = "<Cmd>lua vim.diagnostic.goto_prev()<CR>",
        ["]d"] = "<Cmd>lua vim.diagnostic.goto_next()<CR>",
        ["[e"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
        ["]e"] = "<Cmd>Lspsaga diagnostic_jump_prev<CR>",
    },
}

function M.get_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- for nvim-cmp
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Code actions
    capabilities.textDocument.codeAction = {
        dynamicRegistration = true,
        codeActionLiteralSupport = {
            codeActionKind = {
                valueSet = (function()
                    local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                    table.sort(res)
                    return res
                end)(),
            },
        },
    }

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
    }
    capabilities.experimental = {}
    capabilities.experimental.hoverActions = true

    return capabilities
end

function M.lsp_diagnostics()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = false,
        signs = true,
        update_in_insert = false,
    })

    local on_references = vim.lsp.handlers["textDocument/references"]
    vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, { loclist = true, virtual_text = true })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

    -- -- Send diagnostics to quickfix list
    -- do
    --   local method = "textDocument/publishDiagnostics"
    --   local default_handler = vim.lsp.handlers[method]
    --   vim.lsp.handlers[method] = function(err, meth, result, client_id, bufnr, config)
    --     default_handler(err, meth, result, client_id, bufnr, config)
    --     local diagnostics = vim.diagnostic.get()
    --     local qflist = {}
    --     for buf, diagnostic in pairs(diagnostics) do
    --       for _, d in ipairs(diagnostic) do
    --         d.bufnr = buf
    --         d.lnum = d.range.start.line + 1
    --         d.col = d.range.start.character + 1
    --         d.text = d.message
    --         table.insert(qflist, d)
    --       end
    --     end
    --     vim.diagnostic.setqflist(qflist)
    --   end
    -- end
end

function M.lsp_config(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Key mappings
    local keymap = require "utils.keymap"
    for mode, mapping in pairs(lsp_keymappings) do
        keymap.map(mode, mapping)
    end

    -- Register keymapping in whichkey menu
    local whichkey = require "config.whichkey"
    whichkey.register_lsp(client)

    if client.name == "tsserver" or client.name == "jsonls" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
    end

    if client.server_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    end
end

function M.lsp_highlight(client, bufnr)
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceText cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#282f45
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
            false
        )
    end
end
    
function M.lsp_attach(client, bufnr)
    M.lsp_config(client, bufnr)
    M.lsp_highlight(client, bufnr)
    M.lsp_diagnostics()
end

return M
