return {
  "gelguy/wilder.nvim",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",
  config = function()
    local status_W, wilder = pcall(require, 'wilder')
    if not status_W then
      print("Couldn't find wilder")
      return
    end

    wilder.setup({ modes = { ':', '/', '?' } })

    wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = 'rounded',
        max_height = '75%',  -- max height of the palette
        min_height = 0,      -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0,         -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        highlighter = wilder.basic_highlighter(),
        pumblend = 20,
      })
    ))
  end
}
