return {
  {
    "yanganto/move.vim",
    branch = "sui-move",
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts) opts.servers = require("astrocore").list_insert_unique(opts.servers, { "move_analyzer" }) end,
  },
  { -- Provide the actual config for nvim-lspconfig
    -- (AstroLSP calls lspconfig setup automatically once listed in servers)
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        move_analyzer = {
          cmd = { "move-analyzer" },          -- usually not needed if in PATH
          -- but if you want to be explicit / override:
          -- cmd = { "/full/path/to/move-analyzer" },

          filetypes = { "move" },

          -- root_dir patterns (important for project detection)
          -- Most Move projects have Move.toml at the root
          root_dir = require("lspconfig.util").root_pattern("Move.toml", ".git"),

          -- If your move-analyzer supports extra settings (rarely needed)
          -- settings = { ... },
        },
      },
    },
  },
}
