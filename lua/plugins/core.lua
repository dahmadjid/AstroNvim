return {
  "nvim-lua/plenary.nvim",
  { "AstroNvim/astrotheme",          opts = { plugins = { ["dashboard-nvim"] = true } } },
  { "famiu/bufdelete.nvim",          cmd = { "Bdelete", "Bwipeout" } },
  { "max397574/better-escape.nvim",  event = "InsertCharPre",                           opts = { timeout = 300 } },
  { "NMAC427/guess-indent.nvim",     event = "User AstroFile",                          config = require "plugins.configs.guess-indent" },
  { "Shatur/neovim-session-manager", event = "BufWritePost",                            cmd = "SessionManager" },
  { "s1n7ax/nvim-window-picker",     opts = { use_winbar = "smart" } },
  {
    "mrjones2014/smart-splits.nvim",
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = require "plugins.configs.nvim-autopairs",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
    config = require "plugins.configs.which-key",
  },
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  { 'mg979/vim-visual-multi' }
}
