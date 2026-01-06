-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- Mappature per nvim-dap (Debugging)
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debugger: Start/Continue" })
map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debugger: Step Over" })
map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debugger: Step Into" })
map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debugger: Step Out" })
-- map("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debugger: Toggle Breakpoint" })
-- map("n", "<Leader>du", function() require("dapui").toggle() end, { desc = "Debugger: Toggle UI" })
