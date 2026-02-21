return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      crates = { enabled = true },
    },
    lsp = {
      enabled = true,
      on_attach = function(...) require("astrolsp").on_attach(...) end,
      actions = true,
      completion = true,
      hover = true,
    },
  },
}
