local status_W, wk = pcall(require, "which-key")
if not status_W then
  print("Couldn't find which-key")
  return
end

wk.register({
  ["<leader>n"] = { name = "+drush" },
  ["<leader>nn"] = { "<cmd>terminal ./vendor/bin/drush cr<cr>", "Cache Rebuild" },
  ["<leader>nc"] = { name = "+config" },
  ["<leader>nce"] = { "<cmd>terminal ./vendor/bin/drush cex<cr>", "Config Export" },
  ["<leader>nci"] = { "<cmd>terminal ./vendor/bin/drush cim<cr>", "Config Import" },
  ["<leader>nr"] = { name = "+reports" },
  ["<leader>nrr"] = { "<cmd>terminal ./vendor/bin/drush rq<cr>", "Status Report" },
  ["<leader>ne"] = { name = "+entity" },
  ["<leader>nee"] = { "<cmd>terminal ./vendor/bin/drush generate entity:content<cr>", "Create Entity" },
  ["<leader>nec"] = { "<cmd>terminal ./vendor/bin/drush generate entity:configuration<cr>", "Create Entity Configuration" },
  ["<leader>neb"] = { "<cmd>terminal ./vendor/bin/drush generate entity:bundle-class<cr>", "Create Entity Bundle Class" },
  ["<leader>nf"] = { name = "+form" },
  ["<leader>nfc"] = { "<cmd>terminal ./vendor/bin/drush generate form:config<cr>", "Create Config Form" },
  ["<leader>nfs"] = { "<cmd>terminal ./vendor/bin/drush generate form:simple<cr>", "Create Simple Form" },
  ["<leader>ns"] = { name = "+service" },
  ["<leader>nsc"] = { "<cmd>terminal ./vendor/bin/drush generate service:custom<cr>", "Create Custom Service" },
  ["<leader>nv"] = { name = "+controller" },
  ["<leader>nvc"] = { "<cmd>terminal ./vendor/bin/drush generate controller<cr>", "Create Controller" },
  ["<leader>np"] = { name = "+plugin" },
  ["<leader>npb"] = { "<cmd>terminal ./vendor/bin/drush generate plugin:block<cr>", "Create Block" },
  ["<leader>nt"] = { name = "+test" },
  ["<leader>ntu"] = { "<cmd>terminal ./vendor/bin/drush generate test:unit<cr>", "Create Unit Test" },
})