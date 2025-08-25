return {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local sources = {
      null_ls.builtins.formatting.stylua.with {
        extra_args = { "--search-parent-directories" },
      },
    }

    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
