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
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
  },

})
