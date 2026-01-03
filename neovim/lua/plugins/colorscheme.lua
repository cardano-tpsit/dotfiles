-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "github_dark_dimmed",
--     },
--   },
--   {
--     "projekt0n/github-nvim-theme",
--     priority = 1000,
--   },
-- }
return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme vscode")
    end,
  },
}
