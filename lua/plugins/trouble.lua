return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<leader>d"] = { name = "+diagnostics" },
      ["<leader>dx"] = { "<cmd>TroubleToggle<cr>", "Display TodoTrouble" },
      ["<leader>dw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>",
        "Workspace diagnostics from the builtin LSP client" },
      ["<leader>dd"] = { "<cmd>TroubleToggle document_diagnostics<cr>",
        "Document diagnostics from the builtin LSP client" },
      ["<leader>dq"] = { "<cmd>TroubleToggle quickfix<cr>", "Display QuickFix" },
      ["<leader>dl"] = { "<cmd>TroubleToggle loclist<cr>", "Display LocList" },
      ["<leader>dr"] = { "<cmd>TroubleToggle lsp_references<cr>",
        "References of the word under the cursor from the builtin LSP client" },
    })
  end
}
