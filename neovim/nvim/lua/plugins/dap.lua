return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Configura adapter lldb (codelldb)
      dap.adapters.lldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- Configura adapter cppdbg (per retrocompatibilità)
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }

      -- PYTHON
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Python (auto venv/container)",
          program = "${file}",
          pythonPath = function()
            return vim.fn.getcwd() .. "/dev/python"
          end,
        },
      }

      -- C / C++ - entrambe le configurazioni disponibili
      dap.configurations.cpp = {
        {
          name = "C++ (lldb)",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
        {
          name = "C++ (cppdbg/gdb)",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          MIMode = "gdb",
          miDebuggerPath = vim.fn.getcwd() .. "/dev/run",
        },
      }

      -- usa stessa config per C
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  -- Install adapters automatically
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "codelldb", "cppdbg" },
    },
  },
}
