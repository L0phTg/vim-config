require("mason").setup()
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wl', function()
    --print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- set completeopt=menu,menuone,noselect
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local home_path = os.getenv("HOME")
local workspace_path = vim.fn.getcwd()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found!")
  return
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['yamlls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      yaml = {
        schemas = {
          [home_path.."/.config/nvim/snippets/native_functions_schema.json"] = "/test_native_functions.yaml",
        },
      }
    },
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['tblgen_lsp_server'].setup{
    on_attach = on_attach,
    filetypes = {'tablegen'},
    cmd = {
      "tblgen-lsp-server",
      "--tablegen-compilation-database="..workspace_path.."/build/tablegen_compile_commands.yml",
      "--pretty",
    },
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['mlir_lsp_server'].setup{
    on_attach = on_attach,
    filetypes = {'mlir'},
    cmd = {
      "mlir-lsp-server",
      "--pretty",
    },
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    },
    capabilities = capabilities
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    cmd = {
      home_path.."/.local/share/nvim/mason/bin/clangd",
      "--completion-style=detailed",
      "--cross-file-rename=true",
      "--header-insertion=iwyu",
      "--pch-storage=memory",
      -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
      "--function-arg-placeholders=false",
      "--log=verbose",
      "--ranking-model=decision_forest",
      -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
      "--header-insertion-decorators",
      "--pretty",
    },
    flags = lsp_flags,
    capabilities = capabilities
}

