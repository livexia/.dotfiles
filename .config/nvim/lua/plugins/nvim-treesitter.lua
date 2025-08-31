return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    local ensure_installed = {
      "c",
      "lua",
      "rust",
      "python",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
    }
    require("nvim-treesitter").install(ensure_installed)
  end,
}
