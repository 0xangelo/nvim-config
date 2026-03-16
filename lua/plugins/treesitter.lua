return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "move" })

    ---@class ParserInfo
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.move = {
      install_info = {
        url = "https://github.com/0xangelo/tree-sitter-move",
        branch = "main",
        files = { "src/parser.c" },
      },
    }

    return opts
  end,
}
