return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  lazy =  false,
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required

    {
      -- Optional
      'williamboman/mason.nvim',
      build = function()
        local status_M, mason = pcall(require, "mason")
        if not status_M then
          return
        end
        mason.setup()
        vim.cmd('MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },     -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "L3MON4D3/LuaSnip" },     -- Required
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },

    -- Key Mappings
    "folke/which-key.nvim",
  },
  config = function()
    local status_L, lsp = pcall(require, "lsp-zero")
    if not status_L then
      print("Couldn't find lsp-zero.")
      return
    end

    lsp.preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.ensure_installed({
      "phpactor"
    })

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    lsp.setup()

    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["K"] = { ":lua vim.lsp.buf.hover()<cr>",
        "Displays hover information about the symbol under the cursor in a floating window" },
      ["gd"] = { ":lua vim.lsp.buf.definition()<cr>", "Jumps to the definition of the symbol under the cursor" },
      ["gD"] = { ":lua vim.lsp.buf.declaration()<cr>",
        "Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature" },
      ["gi"] = { ":lua vim.lsp.buf.implementation()<cr>",
        "Lists all the implementations for the symbol under the cursor in the quickfix window" },
      ["go"] = { ":lua vim.lsp.buf.type_definition()<cr>",
        "Jumps to the definition of the type of the symbol under the cursor" },
      ["gr"] = { ":lua vim.lsp.buf.references()<cr>",
        "Lists all the references to the symbol under the cursor in the quickfix window" },
      ["gs"] = { ":lua vim.lsp.buf.signature_help()<cr>",
        "Displays signature information about the symbol under the cursor in a floating window" },
      ["<F2>"] = { ":lua vim.lsp.buf.rename()<cr>", "Renames all references to the symbol under the cursor" },
      ["<F3>"] = { ":lua vim.lsp.buf.format()<cr>", "Format code in current buffer" },
      ["<F4>"] = { ":lua vim.lsp.buf.code_action()<cr>", "Selects a code action available at the current cursor position" },
      ["gl"] = { ":lua vim.diagnostic.open_float()<cr>", "Show diagnostics in a floating window" },
      ["[d"] = { ":lua vim.diagnostic.goto_prev()<cr>", "Move to the previous diagnostic in the current buffer" },
      ["]d"] = { ":lua vim.diagnostic.goto_next()<cr>", "Move to the next diagnostic" },
    })
    local status_C, cmp = pcall(require, "cmp")
    if not status_C then
      print("Couldn't find cmp.")
      return
    end

    local status_L, lsp = pcall(require, "lsp-zero")
    if not status_L then
      print("Couldn't find lsp-zero.")
      return
    end
    local cmp_action = lsp.cmp_action()

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }
    })
  end
}
