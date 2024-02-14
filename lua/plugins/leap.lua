return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function()
    local status_L, leap = pcall(require, "leap")
    if not status_L then
      print("Couldn't find leap")
      return
    end

    leap.add_default_mappings()
  end,
  dependencies = {
    "tpope/vim-repeat",
  },
}
