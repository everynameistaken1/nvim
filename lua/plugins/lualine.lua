return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  event = "VeryLazy",
  config = function()
    local status_L, lualine = pcall(require, "lualine")
    if not status_L then
      print("Couldn't find lualine")
      return
    end

    lualine.setup {
      options = { theme = "tokyonight" },
    }
  end
}
