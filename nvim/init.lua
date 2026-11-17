-- init lazy --
require("config.lazy")

-- termcolor --
vim.opt.termguicolors = true

-- always show the sign column --
vim.opt.signcolumn = "yes"

-- key leader --
vim.g.mapleader = " "

-- split --
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

-- clipboard --
vim.opt.clipboard = "unnamedplus" -- yank in buffer

-- column --
vim.opt.colorcolumn = "120"

vim.api.nvim_set_hl ( 0, "ColorColumn", { bg = "#4c4f69"} )

-- neo-tree  --
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")

require("neo-tree").setup({
  close_if_last_window = false,
  enable_git_status = true,
  window = {
    position = "left",
    width = 25,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
  },
  filesystem = {
    follow_current_file = {
      enable = true,
    },
    filtered_items = {
      visible = true,                    -- показать скрытые
      hide_gitignore = false,
      hide_dotfiles = false,
    },
  },
})

----------------------------------
---------------- lsp -------------

vim.lsp.config('*', {
  root_markers = { '.git' }
})

-- python --
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
})
vim.lsp.enable('pyright')

-- lua --
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server', '--stdio' },
  filetypes = {'lua'},
})
vim.lsp.enable('lua_ls')

-- yaml --
vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes =  {'yaml'},
})
vim.lsp.enable('yamlls')

-- tofu --
vim.lsp.config['tofu_ls'] = {
  cmd = { 'tofu-ls', 'serve' },
  filetypes = { 'terraform', 'terraform-vars', 'tf' },
  root_markers = {'.terraform', '.git'},
}

vim.lsp.enable('tofu_ls')
