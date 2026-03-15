-- if true then return end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Kitty margin management
-- https://www.reddit.com/r/KittyTerminal/comments/1auxxcc/comment/nfzpe77/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd "silent !kitty @ set-spacing margin=-10"
    -- vim.defer_fn(function() vim.cmd "silent !kitty @ set-spacing margin=-10" end, 100)
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function() vim.cmd "silent !kitty @ set-spacing margin=default" end,
})

vim.opt.wrap = true          -- enable visual line wrapping
vim.opt.linebreak = true     -- wrap at word boundaries (don't split words)
