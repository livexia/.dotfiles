return {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("null-ls").setup()
  end,
}
