return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    opts = {
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        cwd = "~/my/git",
        bind_to_cwd = false,
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw = true,
        
        -- Скрытые --
        filtered_items = {
          visible = true,           -- Скрытые файлы видимыми по умолчанию
          show_hidden_count = true, -- Счетчик скрытых
          hide_dotfiles = false,    -- НЕ скрывать файлы, начинающиеся с точки (.git, .env и т.д.)
          hide_gitignored = false,  -- НЕ скрывать файлы из .gitignore
        },
      },
    },

    config = function(_, opts)
      require("neo-tree").setup(opts)
      
      -- Исправленный автостарт
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.schedule(function()
            vim.cmd("Neotree show")
          end)
        end,
      })
    end,
  }
}

