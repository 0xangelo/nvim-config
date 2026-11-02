-- Lean comes from each project's devenv. Without it, only highlight: no language server to warn that
-- it failed to start, and no infoview stuck at "Processing file...".
local has_lean = vim.fn.executable "lake" == 1 or vim.fn.executable "lean" == 1

return {
  -- Added by astrocommunity.pack.lean. Its main branch supports only the latest Neovim; it tags the
  -- last commit for each older release.
  "Julian/lean.nvim",
  tag = vim.fn.has "nvim-0.12" == 0 and "nvim-0.11" or nil,
  opts = { lsp = { enable = has_lean }, infoview = { autoopen = has_lean } },
}
