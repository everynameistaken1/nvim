return {
  "windwp/nvim-autopairs",
  config = function()
    local status_A, autopairs = pcall(require, "nvim-autopairs")
    if not status_A then
      print("Couldn't find autopairs")
      return
    end

    autopairs.setup({})

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local status_C, cmp = pcall(require, 'cmp')
    if not status_C then
      print("Couldn't find cmp")
      return
    end

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end
}
