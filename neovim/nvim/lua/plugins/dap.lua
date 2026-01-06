return {
  -- 1. Core DAP
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

      -- Configura adapter cppdbg (Microsoft)
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
            -- Cerca il binario python nel percorso specificato
            return vim.fn.getcwd() .. "/dev/python"
          end,
        },
      }

      -- C / C++
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
          -- NOTA: MIMode deve essere "gdb" o "lldb"
          MIMode = "gdb",
          -- miDebuggerPath deve puntare al vero eseguibile gdb sul tuo sistema
          miDebuggerPath = "/usr/bin/gdb",
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },
      }

      -- Usa stessa config per C
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  -- 2. Mason Integration (Assicura che gli strumenti siano installati)
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "codelldb", "cppdbg" },
      handlers = {}, -- Previene sovrascritture indesiderate di Mason sulle config manuali sopra
    },
  },
}
