pcall(require, "core.sets")

pcall(require, "plugin-manager.lazy")

local status_L, lazy = pcall(require, "lazy")
if not status_L then
  print("Couldn't find lazy.")
  return
end

lazy.setup("plugins")

pcall(require, "custom.drush")
pcall(require, "custom.linter")

vim.cmd("colorscheme tokyonight")

vim.g.python3_host_prog="/usr/bin/python3"