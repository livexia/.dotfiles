local mason_tools = {
  -- lua
  "lua_ls",
  "stylua",
  "selene",
}

local mason_lsp = {
  -- lua
  "lua_ls",
}

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = mason_tools,
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup {
      automatic_installation = true,
      ensure_installed = mason_lsp,
    }
  end,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
}
