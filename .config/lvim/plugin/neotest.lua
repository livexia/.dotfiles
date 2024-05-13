local function desc(description)
  return { noremap = true, silent = true, desc = description }
end

local neotest = require "neotest"
local wk = require "which-key"

wk.register({
  n = {
    name = "Neotest",
  },
}, { prefix = "<leader>" })

---Neotest is quite heavy on startup, so this initializes it lazily, on keymap
---@diagnostic disable-next-line: missing-fields
neotest.setup {
  adapters = {
    require "rustaceanvim.neotest",
    require "neotest-python" {
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    },
  },
  ---@diagnostic disable-next-line: missing-fields
  discovery = {
    enabled = true,
  },
  icons = {
    failed = "",
    passed = "",
    running = "",
    skipped = "",
    unknown = "",
  },
  quickfix = {
    enabled = false,
    open = false,
  },
}

vim.keymap.set("n", "<leader>nr", neotest.run.run, desc "[n]eotest: [r]un nearest")
vim.keymap.set("n", "<leader>nR", function()
  neotest.run.run { strategy = "dap" }
end, desc "[n]eotest: [r]un nearest DAP")
vim.keymap.set("n", "<leader>nf", function()
  neotest.run.run(vim.api.nvim_buf_get_name(0))
end, desc "[n]eotest: run [f]ile")
vim.keymap.set("n", "<leader>nF", function()
  neotest.run.run { vim.fn.expand "%", strategy = "dap" }
end, desc "[n]eotest: run [f]ile DAP")
vim.keymap.set("n", "<leader>nw", function()
  neotest.watch.toggle(vim.api.nvim_buf_get_name(0))
end, desc "[n]eotest: [w]atch file")
vim.keymap.set("n", "<leader>no", neotest.output.open, desc "[n]eotest: [o]pen output")
vim.keymap.set("n", "<leader>ns", neotest.summary.toggle, desc "[n]eotest: toggle [s]ummary")
