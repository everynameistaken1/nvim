return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  event = "VeryLazy",
  config = function()
    local status_D, dap = pcall(require, "dap")
    if not status_D then
      print("Couldn't find dap")
      return
    end

    local status_DU, dapui = pcall(require, "dapui")
    if not status_DU then
      print("Couldn't find dap ui")
      return
    end

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open()
    -- end
    -- -- Doesn't work
    -- -- Possibly because of running inside a container...
    -- -- Use <leader>ds instead, to shutdown dapui
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- -- Doesn't work
    -- -- Possibly because of running inside a container...
    -- -- Use <leader>ds instead, to shutdown dapui
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end
  end
}
