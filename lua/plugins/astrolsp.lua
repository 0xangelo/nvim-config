-- nixd's option completion comes from the flake that configures this machine.
local function nixd_options()
  local flake, system, name
  if vim.fn.has "mac" == 1 then
    flake, system, name = "~/git/0xangelo/darwin-config", "darwinConfigurations.dawn", "nix_darwin"
  else
    flake, system, name = "~/nixos", "nixosConfigurations.dusk", "nixos"
  end
  local options = ('(builtins.getFlake "%s").%s.options'):format(vim.fn.expand(flake), system)
  return {
    [name] = { expr = options },
    home_manager = { expr = options .. ".home-manager.users.type.getSubOptions []" },
  }
end

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
      "lua_ls",
      "nixd",
      "bashls",
      "markdown_oxide",
      -- add more servers as needed...
    })
    if vim.fn.has "linux" == 1 then table.insert(opts.servers, "hyprls") end
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
      nixd = {
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
            formatting = {
              command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
            },
            options = nixd_options(),
          },
        },
      },
    })
  end,
}
