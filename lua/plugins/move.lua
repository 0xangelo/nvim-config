if true then return {} end -- Comment this to re-enable move-analyzer LSP integration
return {
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
          cmd = { "move-analyzer" },
          filetypes = { "move" },

          -- root_dir patterns (important for project detection)
          -- Most Move projects have Move.toml at the root
          root_dir = require("lspconfig.util").root_pattern("Move.toml", ".git"),
        },
      },
    },
  },
}
