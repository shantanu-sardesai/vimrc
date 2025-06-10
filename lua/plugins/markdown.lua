return {
  {
    "jghauser/follow-md-links.nvim",
    ft = { "markdown" },
    config = function ()
      local set = vim.keymap.set

      set('n', '<bs>', ':edit #<cr>', { silent = true })
    end,
  },
}
