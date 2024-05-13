local neotest = safe_require("neotest")
if not neotest then
  return
end

local function desc(description)
  return { noremap = true, silent = true, desc = description }
end

local wk = require("which-key")

wk.register({
  n = {
    name = "Neotest",
  },
}, { prefix = "<leader>" })

local function neotest_setup()
  ---Neotest is quite heavy on startup, so this initializes it lazily, on keymap
  ---@diagnostic disable-next-line: missing-fields
  neotest.setup {
    adapters = {
      require("rustaceanvim.neotest"),
      require("neotest-python") {
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
end

local status, err = pcall(neotest_setup)
if not status then
  vim.notify("Could not setup module neotest: " .. err, "error", { title = "Neotest Setup Failed" })
  return
end

vim.keymap.set("n", "<leader>nr", neotest.run.run, desc("[n]eotest: [r]un nearest"))
vim.keymap.set("n", "<leader>nR", function()
  neotest.run.run { strategy = "dap" }
end, desc("[n]eotest: [r]un nearest DAP"))
vim.keymap.set("n", "<leader>nf", function()
  neotest.run.run(vim.api.nvim_buf_get_name(0))
end, desc("[n]eotest: run [f]ile"))
vim.keymap.set("n", "<leader>nF", function()
  neotest.run.run { vim.fn.expand("%"), strategy = "dap" }
end, desc("[n]eotest: run [f]ile DAP"))
vim.keymap.set("n", "<leader>nw", function()
  neotest.watch.toggle(vim.api.nvim_buf_get_name(0))
end, desc("[n]eotest: [w]atch file"))
vim.keymap.set("n", "<leader>no", neotest.output.open, desc("[n]eotest: [o]pen output"))
vim.keymap.set("n", "<leader>ns", neotest.summary.toggle, desc("[n]eotest: toggle [s]ummary"))
