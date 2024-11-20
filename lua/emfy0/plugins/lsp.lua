local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.emmet_language_server.setup{
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "heex" }
}
lspconfig.crystalline.setup{
  cmd = { "crystalline" },
  filetypes = { "crystal" },
  root_dir = lspconfig.util.root_pattern("shard.yml", ".git"),
  single_file_support = true
}

lspconfig.helm_ls.setup {}
-- lspconfig.yamlls.setup {}

local lsp = require('lsp-zero')
lsp.preset('recommended')

-- lspconfig.tailwindcss.setup({
--   init_options = {
--     userLanguages = {
--       elixir = "html-eex",
--       eelixir = "html-eex",
--       heex = "html-eex",
--     },
--   },
-- })

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

  ['<A-CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<CR>'] = nil

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.document_symbol() end, opts)
  vim.keymap.set("n", "<leader>S", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

lspconfig.tailwindcss.setup({
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})
vim.cmd([[filetype indent off]])
