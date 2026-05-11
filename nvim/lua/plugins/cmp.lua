-- Enable to reactivate and accept whit the C-y shortcut
-- return {
--   {
--     "saghen/blink.cmp",
--     opts = {
--       keymap = {
--         ["<CR>"] = {},
--         ["<C-y>"] = { "accept" },
--       },
--     },
--   },
-- }
--
return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        trigger = {
          show_on_keyword = false,
          show_on_trigger_character = false,
        },

        menu = {
          auto_show = false,
        },
      },

      keymap = {
        ["<C-space>"] = { "show" },
      },
    },
  },
}
