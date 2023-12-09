return {
  "kylechui/nvim-surround",
  version = "*",   -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<leader>s"] = { name = "+surround" },
      ["<leader>ss"] = { "<Plug>(nvim-surround-normal)iw", "Surround Word" },
      ["<leader>sS"] = { "<Plug>(nvim-surround-normal-cur)", "Surround Line" },
      ["<leader>sc"] = { "<Plug>(nvim-surround-change)", "Change Surround" },
      ["<leader>sd"] = { "<Plug>(nvim-surround-delete)", "Delete Surround" },
    })
  end,
  dependencies = {
    "folke/which-key.nvim",
  },
}
