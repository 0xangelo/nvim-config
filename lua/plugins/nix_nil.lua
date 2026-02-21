return {
  "AstroNvim/astrolsp",
  optional = true,
  opts = function(_, opts) opts.servers = require("astrocore").list_insert_unique(opts.servers, { "nil_ls" }) end,
}
