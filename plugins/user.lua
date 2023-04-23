return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept_word = "<C-w>",
          accept_line = "<C-s>",
        },
      },
    },
  },

  {
    "gbprod/cutlass.nvim",
    lazy = false,
    opts = {
      override_del = true,
      exclude = { "ns", "nS" },
      registers = {
        select = "s",
        delete = "d",
        change = "c",
      },
    },
  },

  {
    "willothy/flatten.nvim",
    opts = {
      callbacks = {
        pre_open = function()
          -- Close toggleterm when an external open request is received
          require("toggleterm").toggle(0)
        end,
        post_open = function(bufnr, winnr, ft)
          if ft == "gitcommit" then
            -- If the file is a git commit, create one-shot autocmd to delete it on write
            -- If you just want the toggleable terminal integration, ignore this bit and only use the
            -- code in the else block
            vim.api.nvim_create_autocmd("BufWritePost", {
              buffer = bufnr,
              once = true,
              callback = function()
                -- This is a bit of a hack, but if you run bufdelete immediately
                -- the shell can occasionally freeze
                vim.defer_fn(function() vim.api.nvim_buf_delete(bufnr, {}) end, 50)
              end,
            })
          else
            -- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
            -- This gives the appearance of the window opening independently of the terminal
            require("toggleterm").toggle(0)
            vim.api.nvim_set_current_win(winnr)
          end
        end,
        block_end = function()
          -- After blocking ends (for a git commit, etc), reopen the terminal
          require("toggleterm").toggle(0)
        end,
      },
    },
  },

  -- {
  --   "aspeddro/gitui.nvim",
  --   lazy = false,
  --   opts = {
  --     window = {
  --       options = {
  --         border = "shadow",
  --       },
  --     },
  --   },
  -- },

  {
    "echasnovski/mini.align",
    lazy = false,
    version = false,
    config = function(_, opts) require("mini.align").setup(opts) end,
  },

  {
    "folke/noice.nvim",
    opts = {
      messages = {
        view_search = false, -- view for search count messages. Set to `false` to disable
      },
    },
  },

  {
    "simrat39/rust-tools.nvim",
    commit = "b0bb504",
    opts = {
      tools = { -- rust-tools options
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- whether to show hints at a fixed column or not
          left_align = true,
        },
      },
    },
  },

  {
    "cshuaimin/ssr.nvim",
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = false,
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
      workspaces = {
        ["tfx"] = "~/tensorfox/galleon",
        ["nix"] = "~/.nix",
        ["nvim"] = "~/.config/nvim",
      },
      db_safe_mode = true,
    },
    config = function() require("telescope").load_extension "frecency" end,
  },

  {
    "chaoren/vim-wordmotion",
    lazy = false,
    init = function() vim.g.wordmotion_prefix = "e" end,
  },
}
