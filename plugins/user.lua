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
    "ray-x/lsp_signature.nvim",
    opts = {
      noice = true,
    },
  },

  {
    "utkarshgupta137/lsp-inlayhints.nvim",
    event = "LspAttach",
    init = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then return end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr, false)
        end,
      })
    end,
    opts = {
      inlay_hints = {
        position = {
          -- where to show the hints. values can be:
          --   nil: show hints after the end of the line
          --   "max_len": show hints after the longest line in the file
          --   "fixed_col": show hints relative to the start of the line (setting padding to ~100)
          align = "fixed_col",
          -- extra padding on the left if align is not nil
          padding = 102,
        },
      },
    },
  },

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
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 5,
      mode = "topline",
      on_attach = function() return vim.bo.filetype ~= "markdown" end,
    },
  },

  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = { -- rust-tools options
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          auto = false,
        },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
      server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = false,
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
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("treesj").setup {} end,
  },

  {
    "chaoren/vim-wordmotion",
    lazy = false,
    init = function() vim.g.wordmotion_prefix = "e" end,
  },

  {
    "Lilja/zellij.nvim",
    opts = {},
  },
}
