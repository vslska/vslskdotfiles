return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { 
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          border = 'rounded',
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = 'rounded',
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
  },
}
