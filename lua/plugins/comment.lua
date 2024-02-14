return {
  'numToStr/Comment.nvim',
  event = "VeryLazy",
  config = function()
    local status_C, comment = pcall(require, 'Comment')
    if not status_C then
      print("Couldn't find comment")
      return
    end

    comment.setup()

    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<C-c>"] = { name = "+comment" },
      ["<C-c>l"] = { "<Plug>(comment_toggle_linewise_current)", "Comment Line" },
      ["<C-c>L"] = { "<Plug>(comment_toggle_linewise)", "Comment Using Count and Motion" },
      ["<C-c>p"] = { "{j<Plug>(comment_toggle_linewise)}", "Comment Current Paragraph" },
    })
  end
}
