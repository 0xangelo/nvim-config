return {

  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "rust" })
      end
    end,
  },

  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      -- handlers = { rust_analyzer = false }, -- disable setup of `rust_analyzer`

      -- This will use the rust-analyzer installed with the toolchain (or any that's in the PATH?),
      -- however the current stable version seems to not take `completion.excludeTraits` well
      -- servers = {
      --   "rust_analyzer",
      -- },

      config = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },

              cargo = {
                allFeatures = true,
              },

              completion = {
                excludeTraits = {
                  "color_eyre::owo_colors::OwoColorize",
                  "core::any::Any",
                  "core::borrow::Borrow",
                  "core::borrow::BorrowMut",
                  "core::convert::Into",
                  "core::convert::TryInto",
                  "moverox_iota::ConvIota",
                  "moverox_iota::ConvMoverox",
                  "moverox_iota::IntoIota",
                  "moverox_iota::IntoMoverox",
                  "owo_colors::OwoColorize",
                  "std::borrow::Borrow",
                  "std::borrow::BorrowMut",
                  "tap::Conv",
                  "tap::Pipe",
                  "tap::Tap",
                  "tap::TapFallible",
                  "tap::TapOptional",
                  "tap::TryConv",
                  "tracing::instrument::Instrument",
                  "tracing::instrument::WithSubscriber",
                },
              },

              rustfmt = {
                extraArgs = {
                  "+nightly-2025-10-29",
                },
              },
            },
          },
        },
      },
    },
  },

  {
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
  },
}
