return {
  "AstroNvim/astrolsp",
  -- we must use the function override because table merging
  -- does not play nicely with list-like tables
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    -- safely extend the servers list
    opts.servers = opts.servers or {}
    vim.list_extend(opts.servers, {
      "rust_analyzer",
      "taplo",
      -- add more servers as needed...
    })
    opts.config = opts.config or {}
    opts.config = vim.tbl_extend("error", opts.config, {
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
                "moverox_iota::Compat",
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
          },
        },
      },
    })
  end,
}
