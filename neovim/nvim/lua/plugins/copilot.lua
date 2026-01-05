return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true

      -- Accetta suggerimento completo
      vim.keymap.set("i", "<C-M-l>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept",
      })

      -- Accetta una parola
      vim.keymap.set("i", "<C-M-j>", "copilot#AcceptWord()", {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Word",
      })

      -- Accetta una riga
      vim.keymap.set("i", "<C-M-k>", "copilot#AcceptLine()", {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot Accept Line",
      })

      -- Naviga tra suggerimenti
      vim.keymap.set("i", "<C-M-n>", "<Plug>(copilot-next)", {
        desc = "Next Copilot suggestion",
      })
      vim.keymap.set("i", "<C-M-p>", "<Plug>(copilot-previous)", {
        desc = "Previous Copilot suggestion",
      })

      -- Dismissi il suggerimento
      vim.keymap.set("i", "<C-M-e>", "<Plug>(copilot-dismiss)", {
        desc = "Dismiss Copilot suggestion",
      })

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

      vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", {
        desc = "Copilot Chat",
      })

      vim.keymap.set("v", "<leader>af", function()
        require("CopilotChat").ask("Fix and improve this code", {
          context = { selection = "visual" },
        })
      end, { desc = "AI Fix selection" })

      vim.keymap.set("v", "<leader>ar", function()
        require("CopilotChat").ask("Refactor this code", {
          context = { selection = "visual" },
        })
      end, { desc = "AI Refactor selection" })

      vim.keymap.set("v", "<leader>ae", function()
        require("CopilotChat").ask("Explain this code", {
          context = { selection = "visual" },
        })
      end, { desc = "AI Explain selection" })
    end,
  },
}
