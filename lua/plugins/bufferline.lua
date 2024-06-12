return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "folke/which-key.nvim",
  },
  config = function()
    local status_B, bufferline = pcall(require, "bufferline")
    if not status_B then
      print("Couldn't find bufferline")
      return
    end

    bufferline.setup({})
    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<leader>g"] = { name = "+buffer/tabs" },
      ["<leader>gt"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      ["<leader>gT"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
      ["<leader>gd"] = { "<cmd>tabo<cr>", "Close All But Current Tabs" },
      ["<leader>gx"] = { "<cmd>%bd|e#<cr>", "Close All But Current Buffers" },
    })
  end,
}
