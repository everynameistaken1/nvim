return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local status_T, todo = pcall(require, "todo-comments")
    if not status_T then
      print("Couldn't find todos")
      return
    end

    todo.setup()

    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<C-n>"] = { name = "+todos" },
      ["<C-n>q"] = { ":TodoQuickFix <cr>", "Display Todoquickfix" },
      ["<C-n>l"] = { ":TodoLocList <cr>", "Display Todoloclist" },
      ["<C-n>t"] = { ":TodoTrouble <cr>", "Display Todotrouble" },
      ["<C-n>T"] = { ":TodoTelescope <cr>", "Display Todotelescope" },
    })
  end
}
