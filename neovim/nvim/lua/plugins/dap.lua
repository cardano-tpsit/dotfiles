return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    opts = function(_, dap)
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

      -- C / C++
      dap.configurations.cpp = {
        {
          name = "C++ (auto)",
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
      ensure_installed = { "python", "cppdbg" },
    },
  },
}
