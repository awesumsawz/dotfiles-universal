return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "php",
          "lua",
          "markdown",
          "bash",
          "css",
          "html",
          "phpdoc",
          "python",
          "regex",
          "scss",
          "sql",
          "yaml",
          "blade",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        },
      })
    end,
  }
}
