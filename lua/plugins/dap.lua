return {
  'mfussenegger/nvim-dap',
  config = function()
    local status_D, dap = pcall(require, "dap")
    if not status_D then
      print("Couldn't find dap")
      return
    end

    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { '/root/.config/vscode-php-debug/out/phpDebug.js' }
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
      }
    }

    local status_W, wk = pcall(require, "which-key")
    if not status_W then
      print("Couldn't find which-key")
      return
    end

    wk.register({
      ["<leader>x"] = { name = "+xdebug" },
      ["<leader>xb"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      ["<leader>xc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue/Resume" },
      ["<leader>xn"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      ["<leader>xi"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      ["<leader>xo"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      ["<leader>xs"] = { "<cmd>DapTerminate<cr><cmd>lua require('dapui').close()<cr>", "Shutdown DapUi" },
    })
  end
}
