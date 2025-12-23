return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Тема должна загружаться первой
    config = function()
      -- Этот код выполнится сразу после загрузки плагина
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
