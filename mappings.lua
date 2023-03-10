-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>x"] = { name = "Trouble" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- ["<leader>gg"] = {
    --     function() require("astronvim.utils").toggle_term_cmd("gitui") end,
    --     desc = "ToggleTerm gitui",
    -- },
    -- ["<leader>tl"] = {
    --     function() require("astronvim.utils").toggle_term_cmd("gitui") end,
    --     desc = "ToggleTerm gitui",
    -- },
    J = { "mzJ`z", desc = "Join lines (keep cursor)" },
    U = { "<C-r>", desc = "Redo" },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-I>"] = { "<cmd>Inspect<cr>", desc = "Inspect" },
    ["<leader>e"] = { "<cmd>Neotree toggle show<cr>", desc = "Toggle Explorer" },
    ["<leader>fg"] = { function() require("telescope.builtin").git_files() end, desc = "Find git files" },
    ["<leader>fr"] = { function() require("telescope").extensions.frecency.frecency() end, desc = "Find frecency" },
    ["<leader>r"] = { ":%sno/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Search & Replace word" },
    ["XX"] = { "dd", desc = "Cut line" },
    -- Common
    X = { "d", desc = "Cut" },
    ["<C-r>"] = { "<cmd>RedrawDeco<cr>", desc = "Refresh indents & rainbow" },
    ["0"] = { "_" },
    ["-"] = { "$" },
    ["_"] = { "-" },
    ["="] = { "%" },
    n = { "nzz" },
    N = { "Nzz" },
    ["gg"] = { "gg_" },
    ["<C-a>"] = { "zz<C-u>" },
    ["<C-d>"] = { "zz<C-d>" },
    ["<C-u>"] = { "zz<C-u>" },
  },
  v = {
    J = { "<cmd>m '>+1<cr>gv=gv", desc = "Move selection down" },
    K = { "<cmd>m '<-2<cr>gv=gv", desc = "Move selection up" },
    ["<leader>r"] = { 'y:%sno/<C-r>"/<C-r>"/gI<Left><Left><Left>', desc = "Search & Replace selection" },
    -- Common
    X = { "d", desc = "Cut" },
    ["<C-r>"] = { "<cmd>RedrawDeco<cr>", desc = "Refresh indents & rainbow" },
    ["0"] = { "_" },
    ["-"] = { "$" },
    ["_"] = { "-" },
    ["="] = { "%" },
    n = { "nzz" },
    N = { "Nzz" },
    ["gg"] = { "gg_" },
    ["<C-a>"] = { "zz<C-u>" },
    ["<C-d>"] = { "zz<C-d>" },
    ["<C-u>"] = { "zz<C-u>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
