return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    "folke/which-key.nvim",
  },
  config = function()
    local status_T, telescope = pcall(require, "telescope")
    if not status_T then
      print("Couldn't find telescope.")
      return
    end

    telescope.load_extension('fzf')

    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<leader>f"] = { name = "+file" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>",
        "Lists files in your current working directory, respects .gitignore" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>",
        "Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)" },
      ["<leader>fc"] = { "<cmd>Telescope buffers<cr>", "Lists open buffers in current neovim instance" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>",
        "Lists available help tags and opens a new window with the relevant help info on <cr>" },
    })
  end
}
