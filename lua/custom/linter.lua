local status_W, wk = pcall(require, "which-key")
if not status_W then
  print("Couldn't find which-key")
  return
end

wk.register({
  ["<leader>l"] = { name = "+PHPCS/PHPCBF" },
  ["<leader>ll"] = { "<cmd>terminal ./vendor/bin/phpcs<cr>", "PHPCS" },
  ["<leader>lc"] = { "<cmd>terminal ./vendor/bin/phpcbf<cr>", "PHPCBF" },
})