return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Evita conflitti con nvim-cmp
      vim.g.copilot_no_tab_map = true

      -- Accetta suggerimento completo
      vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept",
      })

      -- Accetta una parola
      vim.keymap.set("i", "<C-j>", "copilot#AcceptWord()", {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Word",
      })

      -- Accetta una riga
      vim.keymap.set("i", "<C-k>", "copilot#AcceptLine()", {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Line",
      })

      -- Abilita Copilot ovunque
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("CopilotChat").setup()
      vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Copilot Chat" })
      -- Copilot Chat (AI mappings)
      vim.keymap.set("v", "<leader>af", function()
        require("CopilotChat").ask("Fix and improve this code", { context = { selection = "visual" } })
      end, { desc = "AI Fix selection" })

      vim.keymap.set("v", "<leader>ar", function()
        require("CopilotChat").ask("Refactor this code", { context = { selection = "visual" } })
      end, { desc = "AI Refactor selection" })

      vim.keymap.set("v", "<leader>ae", function()
        require("CopilotChat").ask("Explain this code", { context = { selection = "visual" } })
      end, { desc = "AI Explain selection" })
    end,
  },
}
