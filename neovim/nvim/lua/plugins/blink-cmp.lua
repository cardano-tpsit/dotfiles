return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none",

      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },

      -- Tab accetta il completamento
      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      -- Enter NON accetta il completamento
      ["<CR>"] = { "fallback" },
    },
  },
}
